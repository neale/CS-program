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
        train_x = preprocessing.scale(train_x)
        test_x  = preprocessing.scale(test_x)
        
        mlp = MLPClassifier(hidden_layer_sizes=(10,1), batch_size=100, max_iter=1, solver='sgd', verbose=True, learning_rate_init=.01)
        mlp.fit(train_x, train_y)
        print (mlp.score(test_x, test_y))
        num_examples, input_dims = train_x.shape

    scores = []
    for n in [.01]:
        nn = FullyConnected(3072, 10)
        nn.initLayers()
        trainer = Trainer(train_x, train_y, test_x, test_y, nn, epochs=5, lr=n)
        trainer.train() 
        mlp.coefs_[0] = nn.hiddenLayer.W
        mlp.coefs_[1] = nn.outputLayer.W
        scores.append (mlp.score(test_x, test_y))
    print (scores)


