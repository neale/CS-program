"""
Neale Ratzlaff
"""

from __future__ import division
from __future__ import print_function

import sys
import cPickle
import numpy as np

from Loss    import CrossEntropy
from Layers  import ReLU, Linear, Sigmoid
from Network import FullyConnected
from Trainer import Trainer
import warnings 

def load_data():
    data = cPickle.load(open('cifar_2class_py2.p', 'rb'))
    return data

if __name__ == '__main__':
    
    with warnings.catch_warnings():
        warnings.simplefilter("ignore")

        data    = load_data()
        train_x = np.array(data['train_data'])
        train_y = np.array(data['train_labels'])
        test_x  = np.array(data['test_data'])
        test_y  = np.array(data['test_labels'])
        train_y = np.ravel(train_y)
        test_y  = np.ravel(test_y)
        train_x = (train_x - np.mean(train_x, axis=0)) / np.std(train_x, axis=0)
        test_x = (test_x - np.mean(test_x, axis=0)) / np.std(test_x, axis=0)

        num_examples, input_dims = train_x.shape

    scores = []
    for h in [5, 10, 20, 50]:
        batch = 100
        nn = FullyConnected(3072, h, batch)
        nn.initLayers()
        trainer = Trainer(train_x, train_y, test_x, test_y, nn, batch_size=batch, epochs=10, lr=0.1)
        scores.append(trainer.train())
    print (scores)
        


