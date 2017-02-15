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
from sklearn.neural_network import MLPClassifier
from sklearn import preprocessing

def load_data():
    data = cPickle.load(open('cifar_2class_py2.p', 'rb'))
    return data

if __name__ == '__main__':
    
    data    = load_data()
    train_x = np.array(data['train_data'])
    train_y = np.array(data['train_labels'])
    test_x  = np.array(data['test_data'])
    test_y  = np.array(data['test_labels'])
    train_y = np.ravel(train_y)
    test_y  = np.ravel(test_y)
    train_x = preprocessing.scale(train_x)
    test_x  = preprocessing.scale(test_x)
    
    mlp = MLPClassifier(hidden_layer_sizes=(10,1), batch_size=100, max_iter=9, solver='sgd', verbose=True, learning_rate_init=.1)
    print (mlp)
    mlp.fit(train_x, train_y)
    print (mlp.score(test_x, test_y))
    num_examples, input_dims = train_x.shape

    nn = FullyConnected(3072, 10)
    nn.initLayers()
    nn.hiddenLayer.set_params(mlp.coefs_[0])
    nn.outputLayer.set_params(mlp.coefs_[1])
    print ("Hidden: {}".format(nn.hiddenLayer.W))
    print ("output: {}".format(nn.outputLayer.W))
    trainer = Trainer(train_x, train_y, test_x, test_y, nn) 
    #trainer.preprocess()
    trainer.validate()
    sys.exit(0)
    trainer.train() 


