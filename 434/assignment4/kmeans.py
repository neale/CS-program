import numpy as np
import matplotlib.pyplot as plt
import itertools, functools
import operator

def load_data():

    with open('./data.csv', 'rb') as f:
        train = f.readlines()
        train = [line.strip('\n') for line in train]
        for i, line in enumerate(train):
            train[i] = [float(n) for n in train[i].split(',')]
            train[i].append([]) # placeholder for cluster marker
        #train = np.array(train)
    # train[] now is a numpy array of n_samples x n_features

    return train

def euclidian_distance(x, y):

    x1, x2 = x[0], x[1]
    y1, y2 = y[0], y[1]
    return (((x1-y1)**2 + (x2-y2)**2)**.5)

# pick random point, get distances between it and points 
# init from points drawn from normal distribution of distances

class K_Means(object):
    def __init__(self, X, K):
        self.X = X
        self.K = K
        self.distances = []
        self.centers = []
        self.old_clusters = []
        self.update_count = 0
        self.initialize()

    def initialize(self):
        for i in range(self.K):
            self.centers.append(X[np.random.randint(0,len(self.X))][:-1])
            self.old_clusters = [[0]]*self.K
        print "initialized centers to {}".format(self.centers)

    def fit(self):
        while not self.converged():
            self.assign_clusters()
            self.update_centers()
        return self.X, self.centers

    def assign_clusters(self):
        for i, dims in enumerate(self.X):
            d_center = []
            for center in self.centers:
                d_center.append((euclidian_distance(dims, center),center))
            d_center.sort(key=operator.itemgetter(0))
            dims[2] = d_center[0][1]

    def update_centers(self):
        self.update_count += 1
        print "Update {}".format(self.update_count)
        for i, center in enumerate(self.centers):
            update_queue = []
            print "updating cluster center {}".format(i)
            for idx, dims in enumerate(self.X):
                if dims[-1] is center:
                    update_queue.append(dims[:-1])
            new_center = np.mean(np.array(update_queue),axis=0)
            self.old_clusters[i] = center
            self.centers[i] = new_center
        print "updated centers to {}\n\n".format(self.centers)

    def converged(self):
        return set([tuple(x) for x in self.centers]) == set([tuple(x) for x in self.old_clusters])

if __name__ == '__main__':

    X = load_data()
    KMC = K_Means(X, 9)
    clf, centers = KMC.fit()
    print "\n--------------------------------------------------------------------\n"
    print "final centers", centers

