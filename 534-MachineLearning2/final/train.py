from __future__ import print_function

import argparse
from datetime import datetime
import json
import os
import sys
import time

import tensorflow as tf
from tensorflow.python.client import timeline

from src import WaveNetModel, AudioReader, optimizer_factory

STARTED_DATESTRING = "{0:%Y-%m-%dT%H-%M-%S}".format(datetime.now())
EPSILON = 0.001


def get_arguments():
    
    def _str_to_bool(s):
        """Convert string to bool (in argparse context)."""
        if s.lower() not in ['true', 'false']:
            raise ValueError('Argument needs to be a '
                             'boolean, got {}'.format(s))
        return {'true': True, 'false': False}[s.lower()]


    parser = argparse.ArgumentParser(description='WaveNet example network')
    parser.add_argument('--batch_size', type=int, default=1)
    parser.add_argument('--data_dir', type=str, default=DATA_DIRECTORY)
    parser.add_argument('--store_metadata', type=bool, default=False)
    parser.add_argument('--logdir', type=str, default=None)
    parser.add_argument('--logdir_root', type=str, default=None)
    parser.add_argument('--restore_from', type=str, default=None)
    parser.add_argument('--checkpoint_every', type=int, default=100)
    parser.add_argument('--num_steps', type=int, default=1e9)
    parser.add_argument('--learning_rate', type=float, default=0.001)
    parser.add_argument('--wavenet_params', type=str, default='./wavenet_params.json')
    parser.add_argument('--sample_size', type=int, default=100000)
    parser.add_argument('--silence_threshold', type=float, default=0.3)
    parser.add_argument('--optimizer', type=str, default='adam', choices=optimizer_factory.keys())
    parser.add_argument('--momentum', type=float, default=0.9)
    return parser.parse_args()


def save(saver, sess, logdir, step):
    model_name = 'net.ckpt'
    checkpoint_path = os.path.join(logdir, model_name)
    print('Saving checkpoint to {} ...'.format(logdir), end="")
    sys.stdout.flush()

    if not os.path.exists(logdir):
        os.makedirs(logdir)

    saver.save(sess, checkpoint_path, global_step=step)
    print(' Saving to {}'.format(checkpoint_path))
    print(' Done.')


def load(saver, sess, logdir):
    print("Looking for checkpoints in {} ...".format(logdir), end="")

    ckpt = tf.train.get_checkpoint_state(logdir)
    if ckpt:
        print("  Checkpoint found: {}".format(ckpt.model_checkpoint_path))
        global_step = int(ckpt.model_checkpoint_path
                          .split('/')[-1]
                          .split('-')[-1])
        print("  Global step was: {}".format(global_step))
        print("  Restoring...", end="")
        saver.restore(sess, ckpt.model_checkpoint_path)
        print(" Done.")
        return global_step
    else:
        print(" No checkpoint found.")
        return None


def get_default_logdir(logdir_root):
    logdir = os.path.join(logdir_root, 'train', STARTED_DATESTRING)
    return logdir


def validate_directories(args):

    if args.logdir and args.logdir_root:
        raise ValueError("--logdir and --logdir_root cannot be "
                         "specified at the same time.")

    if args.logdir and args.restore_from:
        raise ValueError(
            "--logdir and --restore_from cannot be specified at the same "
            "time. This is to keep your previous model from unexpected "
            "overwrites.\n"
            "Use --logdir_root to specify the root of the directory which "
            "will be automatically created with current date and time, or use "
            "only --logdir to just continue the training from the last "
            "checkpoint.")

    logdir_root = args.logdir_root
    if logdir_root is None:
        logdir_root = './logdir'

    logdir = args.logdir
    if logdir is None:
        logdir = get_default_logdir(logdir_root)
        print('Using default logdir: {}'.format(logdir))

    restore_from = args.restore_from
    if restore_from is None:
        restore_from = logdir

    return {
        'logdir': logdir,
        'logdir_root': args.logdir_root,
        'restore_from': restore_from
    }


def main():
   
    args = get_arguments()
    try:
        directories = validate_directories(args)
    except ValueError as e:
        print("Validation of log directory failed")
        print(str(e))
        return

    logdir = directories['logdir']
    logdir_root = directories['logdir_root']
    restore_from = directories['restore_from']

    is_overwritten_training = logdir != restore_from

    with open(args.wavenet_params, 'r') as f:
        wavenet_params = json.load(f)

    coord = tf.train.Coordinator()
    with tf.name_scope('create_inputs'):

        silence_threshold = args.silence_threshold if args.silence_threshold > \
                                                      EPSILON else None
        #sLibrosa loading of audio files 
        reader = AudioReader(
            args.data_dir,
            coord,
            sample_rate=wavenet_params['sample_rate'],
            sample_size=args.sample_size,
            silence_threshold=args.silence_threshold)
        audio_batch = reader.dequeue(args.batch_size)

    # Create network.
    net = WaveNetModel(
        batch_size=args.batch_size,
        dilations=wavenet_params["dilations"],
        filter_width=wavenet_params["filter_width"],
        residual_channels=wavenet_params["residual_channels"],
        dilation_channels=wavenet_params["dilation_channels"],
        skip_channels=wavenet_params["skip_channels"],
        quantization_channels=wavenet_params["quantization_channels"],
        use_biases=wavenet_params["use_biases"],
        scalar_input=wavenet_params["scalar_input"],
        initial_filter_width=wavenet_params["initial_filter_width"],
        histograms=args.histograms)
    loss = net.loss(audio_batch)
    optimizer = optimizer_factory[args.optimizer](
                    learning_rate=args.learning_rate,
                    momentum=args.momentum)
    trainable = tf.trainable_variables()
    optim = optimizer.minimize(loss, var_list=trainable)

    writer = tf.train.SummaryWriter(logdir)
    writer.add_graph(tf.get_default_graph())
    run_metadata = tf.RunMetadata()
    summaries = tf.merge_all_summaries()

    sess = tf.Session(config=tf.ConfigProto(log_device_placement=False))
    init = tf.initialize_all_variables()
    sess.run(init)

    saver = tf.train.Saver(var_list=tf.trainable_variables())

    try:
        saved_global_step = load(saver, sess, restore_from)
        if is_overwritten_training or saved_global_step is None:
            saved_global_step = -1

    except:
        print("Something went wrong while restoring checkpoint. "
              "We will terminate training to avoid accidentally overwriting "
              "the previous model.")
        raise

    threads = tf.train.start_queue_runners(sess=sess, coord=coord)
    reader.start_threads(sess)

    step = None
    try:
        last_saved_step = saved_global_step
        for step in range(saved_global_step + 1, args.num_steps):
            start_time = time.time()
            if args.store_metadata and step % 50 == 0:
                # Slow run that stores extra information for debugging.
                print('Storing metadata')
                run_options = tf.RunOptions(
                    trace_level=tf.RunOptions.FULL_TRACE)
                summary, loss_value, _ = sess.run(
                    [summaries, loss, optim],
                    options=run_options,
                    run_metadata=run_metadata)
                writer.add_summary(summary, step)
                writer.add_run_metadata(run_metadata,
                                        'step_{:04d}'.format(step))
                tl = timeline.Timeline(run_metadata.step_stats)
                timeline_path = os.path.join(logdir, 'timeline.trace')
                with open(timeline_path, 'w') as f:
                    f.write(tl.generate_chrome_trace_format(show_memory=True))
            else:
                summary, loss_value, _ = sess.run([summaries, loss, optim])
                writer.add_summary(summary, step)

            duration = time.time() - start_time
            print('step {:d} - loss = {:.3f}, ({:.3f} sec/step)'
                  .format(step, loss_value, duration))

            if step % args.checkpoint_every == 0:
                save(saver, sess, logdir, step)
                last_saved_step = step

    except KeyboardInterrupt:
        # Introduce a line break after ^C is displayed so save message
        # is on its own line.
        print()
    finally:
        if step > last_saved_step:
            save(saver, sess, logdir, step)
        coord.request_stop()
        coord.join(threads)


if __name__ == '__main__':
    main()
