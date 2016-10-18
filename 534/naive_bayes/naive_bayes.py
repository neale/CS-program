import itertools
import operator
import numpy as np
import matplotlib.pyplot as plt
import os, sys
import string
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

        return X_dev, X_train, dev_labels, train_labels

def getVocab() :

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
        return d
def plot_smoothing(scores) :
    import matplotlib.pyplot as plt

    factors = [.00001, .0001, .001, .01, .1, 1]
    factors = [np.log(n) for n in factors]
    plt.title("Naive Bayes Accuracy with varied alpha")
    plt.xlabel("smoothing factor alpha")
    plt.ylabel("accuracy (%)")
    plt.plot(factors, scores)
    plt.show()

    
def print_confusion_matrix(pred, truth, labels=None):

    import matplotlib.pyplot as plt

    H_stats = np.zeros(4)
    T_stats = np.zeros(4)
    # [true positives, true negatives, false positives, false negatives]

    for idx, (item, prediction) in enumerate(pred):
        if (prediction is 0) and prediction is not truth[idx]:
            H_stats[2] += 1
            T_stats[3] += 1
        elif (prediction is 0) and prediction is truth[idx]:
            H_stats[0] += 1
            T_stats[1] += 1
        elif (prediction is 1) and prediction is not truth[idx]:
            H_stats[3] += 1
            T_stats[2] += 1
        elif (prediction is 1) and prediction is truth[idx]:
            H_stats[1] += 1
            T_stats[0] += 1

    for candidate in [H_stats, T_stats]:
        confusion = np.array([[candidate[1], candidate[2]],
                              [candidate[3], candidate[0]]])

        norm_conf = []
        for i in confusion:
            a = 0
            tmp_arr = []
            a = sum(i, 0)
            for j in i:
                    tmp_arr.append(float(j)/float(a))
            norm_conf.append(tmp_arr)

        fig = plt.figure()
        plt.clf()
        ax = fig.add_subplot(111)
        ax.set_aspect(1)
        res = ax.imshow(np.array(norm_conf), cmap=plt.cm.jet,
                        interpolation='nearest')

        width, height = confusion.shape

        for x in xrange(width):
            for y in xrange(height):
                ax.annotate(str(confusion[x][y]), xy=(y, x),
                            horizontalalignment='center',
                            verticalalignment='center')

        cb = fig.colorbar(res)
        names = ['Hillary', 'Trump']
        plt.xticks(range(width), names[:width])
        plt.yticks(range(height), names[:height])
        plt.show()


class BnaiveBayesClassifier(object) :

    def __init__(self, valX, valY, X, Y, alpha) :
        self.traindata   = X
        self.trainlabels = Y
        self.valdata     = valX
        self.vallabels   = valY
        self.vocab       = getVocab()
        self.smooth      = alpha
        self.Hprior      = 0.
        self.Tprior      = 0.
        self.H           = {'id' : 0, 'name' : 'CLINTON', 'score' : 0}
        self.T           = {'id' : 1, 'name' : 'TRUMP', 'score' : 0}
        self.predictions = []
        self.accuracy    = 0.
        self.wordIDpairs = [[item[0], item[1][0]] for item in self.vocab.items()]

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
        for idx, tweet in enumerate(self.valdata):

            H_cond = [np.log((self.vocab[word][1]+1)/(self.H['words']+self.smooth)) for word in set(tweet)]
            T_cond = [np.log((self.vocab[word][2]+1)/(self.T['words']+self.smooth)) for word in set(tweet)]

            if self.vallabels[idx] is 0 : name = "CLINTON"
            else                          : name = "TRUMP"

            H_sum = np.sum(H_cond)
            T_sum = np.sum(T_cond)

            H_pred = abs(np.log(self.Hprior) + H_sum)
            T_pred = abs(np.log(self.Tprior) + T_sum)

            self.H['score'] = H_pred
            self.T['score'] = T_pred

            if H_pred < T_pred : pred = self.H
            else               : pred = self.T
            self.predictions.append((tweet, pred['id']))

            if pred['id'] is not self.vallabels[idx] :
                #print "MISMATCH ERROR naive bayes predicted : {} with real label : {}".format(pred['name'], name)
                rlwords = ' '.join([self.vocab[word][0].strip('\n') for word in tweet])+'\n'
                #print rlwords
            else:
                #print "CORRECT naive bayes predicted : {} with real label : {}".format(pred['name'], name)
                correct += 1

        self.accuracy = correct / (len(self.vallabels)) * 100

    def get_top(self, topk):

        print [item[-1][1]/self.H['words'] for item in self.vocab.items()]
        topk_wordsH = sorted([item[-1][1]/self.H['words'] for item in self.vocab.items()], reverse=True)[:topk]
        topk_wordsT = sorted([item[-1][2]/self.T['words'] for item in self.vocab.items()], reverse=True)[:topk]

        print topk_wordsH
        topk_namesH = [self.vocab[word][0] for word in topk_wordsH]
        topk_namesT = [self.vocab[word][0] for word in topk_wordsT]

        return (topk_namesH, topk_namesT)


class MnaiveBayesClassifier(object) :


    def __init__(self, valX, valY, X, Y, alpha) :
        self.traindata   = X
        self.trainlabels = Y
        self.valdata     = valX
        self.vallabels   = valY
        self.vocab       = getVocab()
        self.smooth      = alpha
        self.Hprior      = 0.
        self.Tprior      = 0.
        self.H           = {'id' : 0, 'name' : 'CLINTON', 'score' : 0}
        self.T           = {'id' : 1, 'name' : 'TRUMP', 'score' : 0}
        self.predictions = []
        self.accuracy    = 0.
        self.wordIDpairs = [[item[0], item[1][0]] for item in self.vocab.items()]

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
            item[-1][4] = (item[-1][1]+self.smooth)/(self.H['words']+(self.smooth*len(self.vocab.keys())))
            item[-1][5] = (item[-1][2]+self.smooth)/(self.T['words']+(self.smooth*len(self.vocab.keys())))


    def predict(self):

        correct = 0.
        for idx, tweet in enumerate(self.valdata):
            words = Counter(tweet)
            H_cond = [np.log(self.vocab[word[0]][4]) * word[1] for word in words.items()]
            T_cond = [np.log(self.vocab[word[0]][5]) * word[1] for word in words.items()]

            if self.vallabels[idx] is 0 : name = "CLINTON"
            else                          : name = "TRUMP"

            H_sum = np.sum(H_cond)
            T_sum = np.sum(T_cond)

            H_pred = abs(np.log(self.Hprior) + H_sum)
            T_pred = abs(np.log(self.Tprior) + T_sum)

            self.H['score'] = H_pred
            self.T['score'] = T_pred

            if H_pred < T_pred : pred = self.H
            else               : pred = self.T
            self.predictions.append((tweet, pred['id']))

            if pred['id'] is not self.vallabels[idx] :
                #print "MISMATCH ERROR naive bayes predicted : {} with real label : {}".format(pred['name'], name)
                rlwords = ' '.join([self.vocab[word][0].strip('\n') for word in tweet])+'\n'
                #print rlwords
            else:
                #print "CORRECT naive bayes predicted : {} with real label : {}".format(pred['name'], name)
                correct += 1

        self.accuracy = correct / (len(self.vallabels)) * 100

    def get_top(self, topk):

        topk_valuesH = [item[1]/self.H['words'] for item in self.vocab.values()]
        topk_valuesT = [item[2]/self.T['words'] for item in self.vocab.values()]
        names       = [item[0].strip('\n') for item in self.vocab.values()]
        H_names_values = zip(topk_valuesH, names)
        T_names_values = zip(topk_valuesT, names)

        ex = set(string.punctuation)

        topk_H = [elem for elem in H_names_values if elem[1] not in ex]
        topk_T = [elem for elem in T_names_values if elem[1] not in ex]

        resH = sorted(topk_H, key=operator.itemgetter(0), reverse=True)[:topk]
        resT = sorted(topk_T, key=operator.itemgetter(0), reverse=True)[:topk]

        return (resT, resH)


if __name__ == '__main__':

    val_X, X, val_Y, Y= load_data()
    #nb = BnaiveBayesClassifier(val_X, val_Y, X, Y)
    #nb.fit()
    #nb.predict()

    acc= []
    for alpha in [.00001, .0001, .001, .01, .1, 1]:
        mn = MnaiveBayesClassifier(val_X, val_Y, X, Y, alpha)
        mn.fit()
        mn.predict()
        acc.append(mn.accuracy)
    plot_smoothing(acc)
    #print_confusion_matrix(nb.predictions, nb.vallabels, labels=nb.wordIDpairs)
    #print_confusion_matrix(mn.predictions, mn.vallabels, labels=mn.wordIDpairs)

    top_words = mn.get_top(10)

    #print "top 10 words Trump: {}\ntop 10 words Hillary: {}\n".format([word[1] for word in top_words[0]], [word[1] for word in top_words[1]])
    #print "NB ACCURACY             : {}%".format(nb.accuracy)
    #print "Multunomial NB ACCURACY : {}%".format(mn.accuracy)
