import itertools
import numpy as np
import matplotlib.pyplot as plt
import os, sys

def laod_data() :
    with open("clintontrump.bagofwords.dev", 'rb') as f:
        X_dev = f.readlines()
        for i, line in enumerate(X_dev):
            X_dev[i] = [float(n) for n in line.strip('\n').split(" ")]
        X_dev = np.array(X_train)

    with open("clintontrump.bagofwords.train", 'rb') as f:
        X_train = f.readlines()
        X_train = np.array([float(n) for n in X_train])

    with open("clintontrump.labels.dev", 'rb') as f:
        dev_labels = f.readlines()
        for i, line in enumerate(dev_labels):
            if (line.strip('\n') == "HillaryClinton") :
                dev_labels[i] = 0
            else :
                dev_labels[i] = 1

   with open("clintontrump.labels.train", 'rb') as f:
        train_labels = f.readlines()
        for i, line in enumerate(dev_labels):
            if (line.strip('\n') == "HillaryClinton") :
                train_labels[i] = 0
            else :
                train_labels[i] = 1


    return X_dev, X_train, dev_labels, train_labels

class NaiveBayesClassifier(object) :

    def __init__() :
        traindata   = X
        trainlabels = Y
        valdata     = valX
        vallabels   = valY

    def fit() :
        pass

    def predict() :
        pass

    def score() :
        pass


if __name__ == '__main__'
    val_X, X, val_Y, Y = load_data()
    clf = NaiveBayesClassifier(val_X, val_Y, X, Y)
    clf.fit()
    clf.score()
