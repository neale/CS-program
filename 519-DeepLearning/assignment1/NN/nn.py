print(__doc__)

import matplotlib.pyplot as plt
import numpy as np
import cPickle

from sklearn.neural_network import MLPClassifier
from sklearn import preprocessing
# rescale the data, use the traditional train/test split

# mlp = MLPClassifier(hidden_layer_sizes=(100, 100), max_iter=400, alpha=1e-4,
#                     algorithm='sgd', verbose=10, tol=1e-4, random_state=1)

data = cPickle.load(open('cifar_2class_py2.p', 'rb'))
train_x = np.array(data['train_data'])
train_y = np.array(data['train_labels'])
test_x  = np.array(data['test_data'])
test_y  = np.array(data['test_labels'])

train_y = np.ravel(train_y)
test_y = np.ravel(test_y)

train_x = preprocessing.scale(train_x)
test_x = preprocessing.scale(test_x)
mlp = MLPClassifier(hidden_layer_sizes=(10,1), batch_size=100, learning_rate='adaptive',
                    max_iter=9, solver='sgd', verbose=True, learning_rate_init=.1)

mlp.fit(train_x, train_y)
print("Training set score: %f" % mlp.score(train_x, train_y))
print("Test set score: %f" % mlp.score(test_x, test_y))
