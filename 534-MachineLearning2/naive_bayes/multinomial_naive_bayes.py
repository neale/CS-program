import itertools
import operator
import numpy as np
import matplotlib.pyplot as plt
import os, sys
from collections import defaultdict

def load_data() :
    with open("clintontrump.bagofwords.dev", 'rb') as f:
        X_dev = f.readlines()
        for i, line in enumerate(X_dev):
            X_dev[i] = [n for n in line.strip('\n').split(" ")]
        X_dev = np.array(X_dev)

    with open("clintontrump.bagofwords.train", 'rb') as f:
        X_train = f.readlines()
        for i, line in enumerate(X_train):
            X_train[i] = [n for n in line.strip('\n').split(" ")]
        X_train = np.array(X_train)

    with open("clintontrump.labels.dev", 'rb') as f:
        dev_labels = f.readlines()
        for i, line in enumerate(dev_labels):
            if (line.strip('\n') == "HillaryClinton") :
                dev_labels[i] = 0
            else :
                dev_labels[i] = 1

    with open("clintontrump.labels.train", 'rb') as f:
        train_labels = f.readlines()
        for i, line in enumerate(train_labels):
            if (line.strip('\n') == "HillaryClinton") :
                train_labels[i] = 0
            else :
                train_labels[i] = 1

    with open("clintontrump.vocabulary", 'rb') as f:
        v = f.readlines()
        v = [line.split('\t') for line in v]
        d = defaultdict(list)
        for line in v:
            key = line[0]
            d[key].append(line[-1])
            d[key].extend((0., 0., 0.))

    return X_dev, X_train, dev_labels, train_labels, d

class MNaiveBayesClassifier(object) :

    def __init__(self, valX, valY, X, Y, vocab) :
        self.traindata   = X
        self.trainlabels = Y
        self.valdata     = valX
        self.vallabels   = valY
        self.vocab       = vocab
        self.Hprior      = []
        self.Tmodel      = []
    def fit(self) :

        #read in vocabulary as dict of { [#clinton, #trump, P(X)]
        #allows easy computation of P(Xi | C) and P(Xi | T)
        ##count words (bernoulli)
        #Of the twwets, how many times does any Xi occur in a clinton tweet, or in a trump tweet
        Tcount = float(sum(self.trainlabels)) / len(self.trainlabels);
        Hcount = (len(self.trainlabels) - sum(self.trainlabels)) / float(len(self.trainlabels))

        for idx, tweet in enumerate(self.traindata):
            bernoulli = set(tweet)
            for word in tweet:
                if self.trainlabels[idx] is 0:
                    self.vocab[word][1] += 1
                else:
                    self.vocab[word][2] += 1

                self.vocab[word][3] += 1
#        print self.vocab
        i = 1
        z = len(self.vocab.items())
        #print max(self.vocab.items(), key=lambda x: x[-1][3])
        Hvocab = [item for item in self.vocab.items() if item[-1][1] > 0]
        Tvocab = [item for item in self.vocab.items() if item[-1][2] > 0]

        HXi_list = [np.log((item[-1][1]+1)/(len(Hvocab))) for item in self.vocab.items()]
        TXi_list = [np.log((item[-1][2]+1)/(len(Tvocab))) for item in self.vocab.items()]


        #print HXi_list, len(HXi_list)
        Hnb = np.sum(HXi_list) #reduce(lambda x, y: x * y, HXi_list)
        Tnb = np.sum(TXi_list) #reduce(lambda x, y: x * y, TXi_list)

        Hnb + np.log(Hcount)
        Tnb + np.log(Tcount)

        self.Hprior = Hnb
        self.Tprior = Tnb

    def score(self) :

        for idx, tweet in enumerate(self.traindata):
            for word in tweet:
                print self.vocab[word], " : ", self.Hprior[word], " , ", self.Tprior[word]
        pass


if __name__ == '__main__':

    val_X, X, val_Y, Y, vocab = load_data()
    clf = MNaiveBayesClassifier(val_X, val_Y, X, Y, vocab)
    clf.fit()
    clf.score()
