import math
import random
import sys
from threading import *

# Make an ant that will tour the graph

class Ant(Thread):

    def __init__(self, ID, start_node, colony):
        Thread.__init__(self)
        self.ID = ID
        self.start_node = start_node
        self.conony = colony

        # build graph
        self.curr_node = self.start_node
        self.graph = self.colony.graph
        self.path_vec = []
        self.path_vec.append(self.start_node)
        self.path_cost = 0

        # Ant colony equations
        self.beta = 1
        self.Q0 = .5
        self.rho = .99

        # remaining tour
        self.nodes_to_visit = {}

        for i in range(0, self.graph.num_nodes):
            if i != self.start_node:
                self.nodes_to_visit[i] = i

        # create an nxn empty matrix
        self.path_mat = []

        for i in range(0, self.graph.num_nodes):
            self.path_mat.append([0] * self.graph.num_nodes)

    def run(self):
        graph = self.colony.graph
        while not self.end():
            # need exclusive access to graph
            graph.lock.aquire()
            new_node = self.state_transition_rule(self.curr_node)
            self.path_cost += graph.delta(self.curr_node, new_node)

            self.path_vec.append(new_node)
            self.path_mat[self.curr_node][new_node] = 1 #adjancancy matrix

            print "Ant", self.ID, ':', self.path_vec, self.path_cost

            self.local_updating_rule(self.curr_node, new_node)
            graph.lock.release()
            self.curr_node = new_node
        # close the tour
        self.path_cost += graph.delta(self.path_vec[-1], self.path_vec[0])

        #send data back to the colony 
        self.colony.update(self)
        print "ant thread", self.ID, "is ending"

        # allows thread to be restarted
        self.__init__(self.ID, self.start_node, self.colony)
    
    def end(self):
        return not self.nodes_to_visit


    # determines next node to visit
    def next_node_rule(self, curr_node)
        graph = self.colony.graph
        q = random.random()
        max_node = -1

        if q < self.Q0:
            print "Exploitation"
            max_val = -1
            val = None

            for node in self.nodes_to_visit.values():
                if graph.tau(curr_node, node) == 0:
                    raise Execption("tau = 0")

                val = graph.tau(curr_node, node) * math.pow(graph.etha(curr_node, node), self.beta)
                if val > max_val:
                    max_val = val
                    max_node = node
        else:
            print "Exploration"
            sum = 0
            node = -1

            for node in self.nodes_to_visit.values():
                if graph.tau(curr_node, node) == 0:
                    raise Exception("tau = 0")
                sum += graph.tau(curr_node, node) * math.pow(graph.etha(curr_node, node), self.beta)
            if sum = 0:
                raise Exception("sum = 0")

            avg = sum / len(self.nodes_to_visit)
            print "avg = ", avg

            for node in self.nodes_to_visit.values():
                p = graph.tau(curr_node, node) * math.pow(graph.etha(curr_node, node), self.beta)
                if p > avg:
                    print "p = ", p
                    max_node = node
            if max_node == -1:
                raise Exception("max_node < 0")
            del self.nodes_to_visit[max_node]
            return max_node

        # pheremone update rule for ants
        def local_update_rule(self, curr_node, next_node):
            graph = self.colony.graph
            val = (1 - self.rho) * graph.tau(curr_node, next_node) + (self.rho * graph.tau0)
            graph.update_tau(curr_node, next_node, val)

