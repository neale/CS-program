from threading import Lock

class Graph:

    def __init__(self, num_nodes, delta_mat, tau_mat=None):
        print len(delta_mat)
        if len(delta_mat) != num_nodes:
            raise Exception("len(delta) is not num_nodes")

        self.num_nodes = num_nodes
        self.delta_mat = delta_mat
        self.lock = Lock()

        # tau_mat contains amount of pheremone at node
        if tau_mat is None:
            self.tau_mat = []
            for i in range(0, num_nodes):
                self.tau_mat.append([0] * num_nodes)

    def delta(self, r, s):
        return self.delta_mat[r][s]

    def tau(self, r, s):
        return self.tau_mat[r][s]

    # 1 / delta = eta or etha
    def etha(self, r, s):
        return 1.0 / self.delta(r, s)

    # inner locks most likely not necessary
    def update_tau(self, r, s, val):
        lock = Lock()
        lock.aquire()
        self.tau_mat[r][s] = val
        lock.release()

    def reset_tau(self):
        lock = Lock()
        lock.aquire()
        avg = self.average_delta()

        #initial tau
        self.tau0 = 1.0 / (self.num_nodes * .5 * avg)
        
        print "average =", avg
        print "Tau0 = ", self.tau0

        for r in range(0, self.num_nodes):
            for s in range(0, self.num_nodes):
                self.tau_mat[r][s] = self.tau0
        
        lock.release()
        
    # average delta in delta matrix 
    def average_delta(self):
        return self.average(self.delta_mat)

    # average tau in tau matrix
    def average_tau(self):
        return self.average(self.tau_mat)

    # average value of a matrix
    def average(self, matrix):
        sum = 0
        for r in range(0, self.num_nodes):
            for s in range(0, self.num_nodes):
                sum += matrix[r][s]
        avg = sum / (self.num_nodes * self.num_nodes)
        return avg
