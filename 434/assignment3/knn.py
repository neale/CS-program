import numpy as np
import operator
import matplotlib.pyplot as plt

def load_data():

    with open('./knn_train.csv', 'rb') as f:
        train = f.readlines()
        train = [line.strip('\n') for line in train]
        for i, line in enumerate(train):
            train[i] = [float(n) for n in train[i].split(',')]
        train = np.array(train)
        train_labels = train[:,0]
        train_data = np.zeros((train.shape))
        train_data[:, -1] = train[:,0]
        train_data[:,:-1] = train[:,1:]
    # train[] now is a numpy array of n_samples x n_features
    # read in test data
    with open('./knn_test.csv', 'rb') as f:
        test =  f.readlines()
        test =  [line.strip('\n') for line in test]
        for i, line in enumerate(test):
            test[i] = [float(n) for n in test[i].split(',')]
        test =  np.array(test)
        test_labels = test[:,0]
        test_data = test[:,1:]
    # images are represented in each row of pixels
    return train_data, test_data, test_labels

def k_fold_cross_validation(train, test, test_labels, params):
    foldsize = int(len(train)/5) # K
    averages = []
    for k in params['K']:
        scores = []
        for i in range(5):
            np.random.shuffle(train)
            val = train[i*foldsize:][:foldsize]
            tr  = np.concatenate((train[:i*foldsize],train[(i+1)*foldsize:]), axis=0)
            clf = KNN(tr, val, val[:,-1], k)
            clf.fit()
            clf.score()
            scores.append(clf.acc)
        average_score = sum(scores)/len(scores)
        print "average accuracy for KNN with {} boundries: {}".format(k, sum(scores)/len(scores))
        averages.append((average_score, k))
    return sorted(averages, key=operator.itemgetter(0), reverse=True)[0]

def leave_one_out_cross_validation(train, test, params):
    averages = []
    for K in params['K']:
        scores = []
        for i in range(len(train)):
            val = np.array(train[i])
            tr  = np.concatenate((train[:i], train[i+1:]),axis=0)
            clf = KNN(tr, val, val[-1], K)
            clf.fit()
            clf.score()
            scores.append(clf.acc)
        average_score = sum(scores)/len(scores)
        print "average leave-one-out accuracy for KNN with {} boundries: {}".format(K, sum(scores)/len(scores))
        averages.append((average_score, K))
    return sorted(averages, key=operator.itemgetter(0), reverse=True)[0]

def testK(train, test, test_labels, params):
    for K in params['K']:
        val = np.array(test)
        tr = np.array(train)
        clf = KNN(tr, val, test_labels, K)
        clf.fit()
        clf.score()
        score = clf.acc
        print "testing score with K = {} : {}".format(K, score)

""" returns the ordinary (euclidian) distance between two vectors """
def euclidian_distance(x1, x2, l):
    distance = 0
    if l > 1:
        for point in range(l):
            distance += ((x1[point] - x2[point])**2)
    else:
        distance = ((x1 - x2)**2)

    return distance**.5

class KNN(object):

    def __init__(self, train_data, test_data, test_labels, K):
        self.train = train_data
        self.val = test_data
        self.val_labels = test_labels
        self.K = K
        self.neighbors = []
        self.Kclass = []
        self.acc = 0

    def fit(self):
        if hasattr(self.val[0], '__len__'):
            for i in xrange(len(self.val)):
                self.nearest_neighbors(self.val[i], len(self.val[i]))
                self.predict()
        else:
            self.nearest_neighbors(self.val, len(self.val))
            self.predict()

    def nearest_neighbors(self, test, l):
        distances = []
        for i in xrange(len(self.train)):
            d = euclidian_distance(test, self.train[i], l)
            distances.append((self.train[i], d))
        # C indexing instead of python lambda with itemgetter
        distances.sort(key=operator.itemgetter(1))
        self.neighbors = []
        for i in xrange(self.K):
            self.neighbors.append(distances[i][0])

    def predict(self):

        nearest_class = {}
        for i in xrange(len(self.neighbors)):
            pred = self.neighbors[i][-1]
            if pred not in nearest_class:
                nearest_class[pred] = 1
            else:
                nearest_class[pred] += 1
        res = sorted(nearest_class.iteritems(), key=operator.itemgetter(1), reverse = True)[0][0]
        self.Kclass.append(res)


    def score(self):
        correct = 0.
        if hasattr(self.val_labels, '__len__'):
            for i in xrange(len(self.val)):
                if self.val_labels[i] == self.Kclass[i]:
                    correct += 1.
            self.acc= correct / len(self.val) * 100
        else:
            if self.val_labels == self.Kclass:
                correct += 1.
            self.acc= correct * 100

if __name__ == '__main__':

    # make dict of default hyperparameters
    params = {
            'K' : [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25],
            'split' : [.05, .1, .15, .2, .25, .3, .35]
    }
    train_data, test_data, test_labels = load_data()
    average, K = k_fold_cross_validation(train_data, test_data, test_labels, params)
    print "selecting best model hyperparameters\nK = {} with the best average of {}".format(average, K)
    average, K = leave_one_out_cross_validation(train_data, test_data, params)
    print "Leave one out score with K of {}: {}".format(K, average)
    clf = KNN(train_data, test_data, test_labels, K)
    clf.fit()
    clf.score()
    print "Final testing score: {} using {} boundries".format(clf.acc, K)
    testK(train_data, test_data, test_labels, params)

