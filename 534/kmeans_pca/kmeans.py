import numpy as np
import matplotlib.pyplot as plt
import itertools, functools
import operator

def load_data():

    with open('./walking.train.data', 'rb') as f:
        train = f.readlines()
        train = [line.strip('\n') for line in train]
        for i, line in enumerate(train):
            train[i] = [float(n) for n in train[i].split(' ')]
            train[i].append([]) # placeholder for cluster marker
        #train = np.array(train)
    # train[] now is a numpy array of n_samples x n_features

    
    return train

def euclidian_distance(x, y):

    return np.linalg.norm(np.array(x[:-1])-np.array(y))

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
        self.SSE = []
        self.initialize()
        

    def initialize(self):

        for i in range(self.K):
            rand = np.random.randint(0, len(self.X))
            self.centers.append(self.X[rand][:-1])
            self.old_clusters.append([0 for i in self.X[0]])
        #print "initialized centers to {}".format(self.centers)
        
        #print "OLD CLUSTERS : " , self.old_clusters

    def fit(self):
        while not self.converged():
            self.assign_clusters()
            self.update_centers()
        return self.X, self.centers

    ''' gets the distance of each point to each center then takes the min distance as its assigned center'''
    def assign_clusters(self):
        sse_sum = 0
        for i, dims in enumerate(self.X):
            d_center = []
            for center in self.centers:
                d_center.append((euclidian_distance(dims, center),center))
            d_center.sort(key=operator.itemgetter(0))
            dims[-1] = d_center[0][1]
            sse_sum += d_center[0][0]
        self.SSE.append(sse_sum)

    ''' computes the new center of each cluster based on the SSE'''
    def update_centers(self):
        self.update_count += 1
        #print "Update {}".format(self.update_count)
        for i, center in enumerate(self.centers):
            update_queue = []
            #print "updating cluster center {}".format(i)
            
            for idx, dims in enumerate(self.X):
                if dims[-1] is center:
                    update_queue.append(dims[:-1])
            new_center = np.mean(np.array(update_queue),axis=0)
            self.old_clusters[i] = center
            self.centers[i] = new_center

    def converged(self):
        s1 = set(map(tuple, self.centers))
        s2 = set(map(tuple, self.old_clusters))
        return (s1 == s2)
    
    ''' plotting functions to display SSE '''
    def plot(self):
        datamap = []
        def color():
            return (np.random.rand(3,1))
        f = plt.figure()
        ax = f.add_subplot(1, 1, 1)
        for i, center in enumerate(self.centers):
            hold = []
            for point in self.X:
                if point[-1][0] == center[0]:
                    hold.append(point[:-1])
            datamap.append(hold)
        for cluster in datamap:
            ax.scatter([x[0] for x in cluster], [y[1] for y in cluster], c=color())
        f = plt.figure()
        bx = f.add_subplot(1, 1, 1)
        bx.plot(range(0, len(self.SSE)), self.SSE, c=color())
        bx.set_title('SSE for K = {}'.format(self.K))
        bx.set_xlabel('iteration')
        bx.set_ylabel('SSE')

        plt.show()

if __name__ == '__main__':

    X = load_data()
    k_vals = [3, 4, 5, 6, 7, 8, 9, 10]
    sse = []
    k_sse = []
    for K in k_vals:
        print "K = ", K
        for _ in range(10): 
            KMC = K_Means(X, K)
            clf, centers = KMC.fit()
            print "\n--------------------------------------------------------------------\n"
            print "final centers", centers
            KMC.plot()
            print KMC.SSE
            if (KMC.SSE) :
                sse.append(min(KMC.SSE))
        if sse:
            k_sse.append(min(sse))
    plt.plot(range(len(k_sse)), k_sse, color= 'm')
    plt.show()

