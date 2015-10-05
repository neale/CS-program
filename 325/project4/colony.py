from ant import Ant
from threading import Lock, Condition

import random
import sys

class Colony:

    def __init__(self, graph, num_nodes, num_iterations):
        self.graph = graph
        self.num_ants = num_ants
        self.num_iterations = num_iterations
        self.alpha = .1

        # condition var
        self.cv = Condition()
        self.reset()

    def reset(self):
        self.best_path_cost = sys.maxint
        self.best_path_vec = None
        self.best_path_mat = None
        self.last_best_path_iteration = 0

    def start(self):
        self.ants = self.create_ants()
        self.iter_counter = 0

        while self.iter_counter < self.num_iterations:
            self.iteration()
            self.cv.aquire()
            # wait until update calls notify()
            self.cv.wait()

            lock = self.graph.lock
            lock.aquire()
            self.global_update_rule()
            lock.release()

            self.cv.release()

    # one iteration
    def iteration(self):
        self.avg_path_cost = 0
        self.ant_counter = 0
        self.iter_counter += 1
        print "iter_counter =", self.iter_counter)
        for ant in self_ants:
            print "starting at ant = ", ant.ID
            ant.start()

    def num_ants(self):
        return len(self.ants)
    
    def num_iterations(self):
        return self.num_iterations

    def iteration_counter(self):
        retiur self.num_iterations

    # called by ants to update paths/pheremones
    def update(self, ant):
        lock = Lock()
        lock.aquire()

        #outfile = open(results.txt, "a")
        print "update called by ant: ", ant.ID
        self.ant_counter += 1
        self.avg_pth_cost += ant.path_cost

        # keep internal records
        if ant.path_cost < self.best_path_cost:
            self.best_path_cost = ant.path_cost
            self.best_path_mat = ant.path_mat
            self.best_path_vec = ant.path_vec
            self.last_best_path_iteration = self.iter_counter

        if self.ant_counter == len(self.ants):
            self.avg_path_cost /= len(self.ants)
            print "best path: ", self.best_path_vec, self.best_path_cost, self.iter_counter, self.avg_path_cost
            #outfile.write("\n%s\t%s\t%s" % (self.iter_counter, self.avg_path_cost, self.best_path_cost,))  
            self.cv.aquire()
            self.cv.notify()
            self.cv.release()
        #outfile.close()
        lock.release()

    def done(self):
        return self.iter_counter == self.num_iterations
    # assign each any a random start
    def create_ants(self):
        self.reset()
        ants = []
        for i in range(0, self.num_ants):
            ant = Ant(i, random.randint(0, self.graph.num_nodes - 1), self)
            ants.append(ant)
        return ants

    # changes the tau matrix based on updates
    def global_updating_rule(self):
        evaportation = 0
        deposition = 0
        for r in range(0, self.graph.num_nodes):
            for s in range(0, self.graph.num_nodes):
                if r != s:
                    delt_tau = se;f.best_path_mat[r][s] / self.best_path_cost
                    evaporation = (1 - self.alpha) * self.graph.tau(r, s)
                    deposition = self.alpha * delt_tau
                    self.graph.update_tau(r, s, evaporation + deposition)a
