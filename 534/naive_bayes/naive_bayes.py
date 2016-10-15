import itertools
import operator
import numpy as np
import matplotlib.pyplot as plt
import os, sys
from collections import defaultdict, Counter

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
            d[key].extend((0., 0., 0., 0., 0.))
            # appending fields for
            # * times word appears in clinton tweet
            # * times word appears in trump tweet
            # * total occurances in dataset
            # * MLE for clinton
            # * MLE for trump
    return X_dev, X_train, dev_labels, train_labels, d

class BnaiveBayesClassifier(object) :

    def __init__(self, valX, valY, X, Y, vocab) :
        self.traindata   = X
        self.trainlabels = Y
        self.valdata     = valX
        self.vallabels   = valY
        self.vocab       = vocab
        self.Hprior      = 0
        self.Tprior      = 0
        self.H           = {'id' : 0, 'name' : 'CLINTON', 'score' : 0}
        self.T           = {'id' : 1, 'name' : 'TRUMP', 'score' : 0}
    def fit(self) :

        #read in vocabulary as dict of { [#clinton, #trump, P(X)]
        #allows easy computation of P(Xi | C) and P(Xi | T)
        ##count words (bernoulli)
        #Of the twwets, how many times does any Xi occur in a clinton tweet, or in a trump tweet
        self.Tprior = float(sum(self.trainlabels)) / len(self.trainlabels);
        self.Hprior = (len(self.trainlabels) - sum(self.trainlabels)) / float(len(self.trainlabels))

        for idx, tweet in enumerate(self.traindata):
            bernoulli = set(tweet)
            for word in bernoulli:
                if self.trainlabels[idx] is 0:
                    self.vocab[word][1] += 1
                else:
                    self.vocab[word][2] += 1

                self.vocab[word][3] += 1

        self.H['words'] = np.sum([1 for item in self.vocab.items() if item[-1][1] > 0])
        self.T['words'] = np.sum([1 for item in self.vocab.items() if item[-1][2] > 0])


    def predict(self):

        correct = 0.
        for idx, tweet in enumerate(self.traindata):

            H_cond = [self.vocab[word][1]/self.H['words'] for word in set(tweet)]
            T_cond = [self.vocab[word][2]/self.T['words'] for word in set(tweet)]

            if self.trainlabels[idx] is 0 : name = "CLINTON"
            else                          : name = "TRUMP"

            H_sum = np.sum(H_cond)
            T_sum = np.sum(T_cond)

            H_pred = abs(np.log(self.Hprior * H_sum))
            T_pred = abs(np.log(self.Tprior * T_sum))

            self.H['score'] = H_pred
            self.T['score'] = T_pred

            if H_pred < T_pred : pred = self.H
            else               : pred = self.T

            if pred['id'] is not self.trainlabels[idx] :
                print "MISMATCH ERROR naive bayes predicted : {} with real label : {}".format(pred['name'], name)
                rlwords = ' '.join([self.vocab[word][0].strip('\n') for word in tweet])+'\n'
                print rlwords
            else:
                print "CORRECT naive bayes predicted : {} with real label : {}".format(pred['name'], name)
                correct += 1

        print "ACCURACY : {}%".format(correct/len(self.traindata) * 100.)

class MnaiveBayesClassifier(object) :


    def __init__(self, valX, valY, X, Y, vocab) :
        self.traindata   = X
        self.trainlabels = Y
        self.valdata     = valX
        self.vallabels   = valY
        self.vocab       = vocab
        self.Hprior      = 0
        self.Tprior      = 0
        self.H           = {'id' : 0, 'name' : 'CLINTON', 'score' : 0}
        self.T           = {'id' : 1, 'name' : 'TRUMP', 'score' : 0}
    def fit(self) :

        #read in vocabulary as dict of { [#clinton, #trump, P(X)]
        #allows easy computation of P(Xi | C) and P(Xi | T)
        ##count words (bernoulli)
        #Of the twwets, how many times does any Xi occur in a clinton tweet, or in a trump tweet
        self.Tprior = float(sum(self.trainlabels)) / len(self.trainlabels);
        self.Hprior = (len(self.trainlabels) - sum(self.trainlabels)) / float(len(self.trainlabels))

        for idx, tweet in enumerate(self.traindata):
            for word in tweet:
                if self.trainlabels[idx] is 0:
                    self.vocab[word][1] += 1
                else:
                    self.vocab[word][2] += 1

                self.vocab[word][3] += 1

        self.H['words'] = np.sum([1 for item in self.vocab.items() if item[-1][1] > 0])
        self.T['words'] = np.sum([1 for item in self.vocab.items() if item[-1][2] > 0])

        for item in self.vocab.items():
            item[-1][4] = item[-1][1]+1/(self.H['words']+len(self.vocab.keys()))
            item[-1][5] = item[-1][2]+1/(self.T['words']+len(self.vocab.keys()))


    def predict(self):

        correct = 0.
        for idx, tweet in enumerate(self.traindata):
            words = Counter(tweet)
            H_cond = [np.log(self.vocab[word[0]][4]) * word[1] for word in words.items()]
            T_cond = [np.log(self.vocab[word[0]][5]) * word[1] for word in words.items()]

            if self.trainlabels[idx] is 0 : name = "CLINTON"
            else                          : name = "TRUMP"

            H_sum = np.sum(H_cond)
            T_sum = np.sum(T_cond)

            H_pred = abs(np.log(self.Hprior) + H_sum)
            T_pred = abs(np.log(self.Tprior) + T_sum)

            self.H['score'] = H_pred
            self.T['score'] = T_pred

            if H_pred < T_pred : pred = self.H
            else               : pred = self.T

            if pred['id'] is not self.trainlabels[idx] :
                print "MISMATCH ERROR naive bayes predicted : {} with real label : {}".format(pred['name'], name)
                rlwords = ' '.join([self.vocab[word][0].strip('\n') for word in tweet])+'\n'
                print rlwords
            else:
                print "CORRECT naive bayes predicted : {} with real label : {}".format(pred['name'], name)
                correct += 1

        print "ACCURACY : {}%".format(correct/len(self.traindata) * 100.)


if __name__ == '__main__':

    val_X, X, val_Y, Y, vocab = load_data()
    clf = BnaiveBayesClassifier(val_X, val_Y, X, Y, vocab)
    clf.fit()
    clf.predict()

    clf = MnaiveBayesClassifier(val_X, val_Y, X, Y, vocab)
    clf.fit()
    clf.predict()

