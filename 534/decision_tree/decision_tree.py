import os
import sys
import operator
import itertools
import matplotlib.pyplot as plt
import numpy as np
import collections

def import_data():
    
    with open('iris_train-1.csv', 'rb') as f:
        X = f.readlines()
        for i, l in enumerate(X):
            X[i] = X[i].strip('\r\n').split(';')
            X[i] = [float(n) for n in X[i]]
        X_train = np.array(X)
        Y_train = X_train[:,-1]

    with open('iris_test-1.csv', 'rb') as f:
        X = f.readlines()
        for i, l in enumerate(X):
            X[i] = X[i].strip('\r\n').split(';')
            X[i] = [float(n) for n in X[i]]
        X_test = np.array(X)
        Y_test = X_train[:,-1]

    return X_train, Y_train, X_test, Y_test

def entropy(X, feature, theta):
    #information gain is given by:
    # -p1*log2(p1) - p2*log2(p2) - p3*log2(p3)
    p1t, p1f = [], []
    p2t, p2f = [], []
    p3t, p3f = [], []

    total = float(len(X))
    for row in X:
        if row[feature] > theta:
           if row[-1] == 0.0: p1t.append(row)
           if row[-1] == 1.0: p2t.append(row)
           if row[-1] == 2.0: p3t.append(row)
        else:
           if row[-1] == 0.0: p1f.append(row)
           if row[-1] == 1.0: p2f.append(row)
           if row[-1] == 2.0: p3f.append(row)

            # now we have filtered lists
    # total elements in positive half of split
    ptotal = float(len(p1t)+len(p2t)+len(p3t))
    # total elements in negative half of split
    ntotal = float(len(p1f)+len(p2f)+len(p3f))

    # gain from each half of the split
    if ptotal > 0:
        if len(p1t) > 0: pgain1 = -(len(p1t)/ptotal)*np.log2(len(p1t)/ptotal)
        else :           pgain1 = 0
        if len(p2t) > 0: pgain2 = -(len(p2t)/ptotal)*np.log2(len(p2t)/ptotal)
        else:            pgain2 = 0
        if len(p3t) > 0: pgain3 = -(len(p3t)/ptotal)*np.log2(len(p3t)/ptotal)
        else:            pgain3 = 0
        Hp = pgain1 - pgain2 - pgain3
    else:
        Hp = 0

    if ntotal > 0:
        if len(p1f) > 0: ngain1 = -(len(p1f)/ntotal)*np.log2(len(p1f)/ntotal)
        else :           ngain1 = 0
        if len(p2f) > 0: ngain2 = -(len(p2f)/ntotal)*np.log2(len(p2f)/ntotal)
        else:            ngain2 = 0
        if len(p3f) > 0: ngain3 = -(len(p3f)/ntotal)*np.log2(len(p3f)/ntotal)
        else:            ngain3 = 0
        Hn = ngain1 - ngain2 - ngain3
    else:
        Hn = 0

    # total information gain given by H(top level) -H(splits)
    x1 = filter(lambda x: x[-1] == 0, X) 
    x2 = filter(lambda x: x[-1] == 1, X) 
    x3 = filter(lambda x: x[-1] == 2, X) 

    Hx1 = -(len(x1)/total) * np.log2(len(x1)/total)
    Hx2 = -(len(x2)/total) * np.log2(len(x2)/total)
    Hx3 = -(len(x3)/total) * np.log2(len(x3)/total)

    Hx  = Hx1-Hx2-Hx3
    H   = Hx - (ptotal/total)*Hp - (ntotal/total)*Hn

    return H


class RandomForest(object):

    def __init__(self, Xtr, Ytr, Xte, Yte, n):
        self.X_train = Xtr
        self.Y_train = Ytr
        self.X_test  = Xte
        self.Y_test  = Yte
        n_trees      = n
	self.gain  = []
   
    def apply(self):
	pass

    def fit(self):
        # get feature with the highest information gain
        theta = 0
        total_examples = len(self.X_train[1])
        for col in range(total_examples-1):
            print "*** Feature {} ***".format(col)
            # for each feature we need to compute information gain by splitting on some threshold
            for threshold in range(10):
                self.gain.append( ( np.exp ( entropy(self.X_train, col, threshold) ), threshold ) )

            t = max(self.gain, key=operator.itemgetter(0))
            print "gain for feature {} is a split of theta = {} : {}".format(col, t[1], t[0])
            self.gain = []
    def predict(self):
	pass

    def decision_path(self):
	pass


if __name__ == '__main__':
    
    Xtr, Ytr, Xte, Yte = import_data()
    clf = RandomForest(Xtr, Ytr, Xte, Yte, 1)
    
    clf.fit()
    clf.predict()

    
   
