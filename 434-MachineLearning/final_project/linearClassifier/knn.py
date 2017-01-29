import sys
import itertools, functools
import collections
import numpy
import matplotlib.pyplot as plt

from sklearn.decomposition import PCA
from sklearn.svm import SVC
from sklearn.datasets import fetch_mldata
from sklearn.neighbors import KNeighborsClassifier as KNN
from sklearn.preprocessing import StandardScaler
from sklearn.neural_network import MLPClassifier


datapath = '../data/train.cxv'
testpath = '../data/test.cxv'

def load_data():
    mnist = fetch_mldata('MNIST original')
    X, y = mnist.data / 255., mnist.target
    X_train, X_test = X[:60000], X[60000:]
    y_train, y_test = y[:60000], y[60000:]
    return X_train, X_test, y_train, y_test

def build_clf(X, y, clf_class, **kwargs):
    """build any classifier that implements a fit method with
    given parameters"""

    clf = clf_class(**kwargs)
    clf_fit = clf.fit(X, y)
    return clf_fit


if __name__ == '__main__':
    X_train, X_test, Y_train, Y_test = load_data()
    KNN_hyperparams = {
        'n_neighbors' : 9,
        'n_jobs'      : -1,
        'algorithm'   : 'auto',
        'p'           : 1,
        'leaf_size'   : 10
    }
    MLP_hyperparams = {
        'hidden_layer_sizes' : 512,
        'activation'         : 'relu',
        'algorithm'          : 'sgd',
        'batch_size'         : 'auto',
        'max_iter'           : 500,
        'verbose'            : True
    }
    """
    print "building KNN"
    knn = build_clf(X_train, Y_train, KNN, **KNN_hyperparams)
    print "KNN Training set score: %f" % knn.score(X_train, Y_train)
    print "KNN Test set score: %f" % knn.score(X_test, Y_test)

    """
    print "building MLP"
    mlp = build_clf(X_train, Y_train, MLPClassifier, **MLP_hyperparams)
    print "MLP 1 Training set score: %f" % mlp.score(X_train, Y_train)
    print "MLP 1 Test set score: %f" % mlp.score(X_test, Y_test)

    fig, axes = plt.subplots(4, 4)
    # use global min / max to ensure all weights are shown on the same scale
    vmin, vmax = mlp.coefs_[0].min(), mlp.coefs_[0].max()
    for coef, ax in zip(mlp.coefs_[0].T, axes.ravel()):
        ax.matshow(coef.reshape(28, 28), cmap=plt.cm.gray, vmin=.5 * vmin,
                   vmax=.5 * vmax)
        ax.set_xticks(())
        ax.set_yticks(())

    plt.show()
