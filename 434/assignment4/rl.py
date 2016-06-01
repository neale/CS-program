import operator
import numpy as np
import matplotlib.pyplot as plt
import itertools, functools

""" Grid Layout
    grid[0][0] = num_states
    grid[0][1] = num_actions
"""
def load_data():

    with open('./rldata.csv', 'rb') as f:
        train = f.readlines()
        train = [line.strip('\n') for line in train]
        train[0] = [int(a) for a in train[0].split(' ')]
        num_states, num_actions = train[0]
        lines = num_actions * num_states + num_actions
        grid = []
        for i in range(1, lines+3):
            if (i-1) % 11 is not 0:
                grid.append([float(n) for n in train[i].split(' ')[::4]])
                train[i] = [float(n) for n in train[i].split(' ')[::4]]
        actions = []
        for i in range(num_actions):
            actions.append(grid[(i*num_states):((1+i)*num_states)])
        train = np.array(train)
    return train, actions 

class MDP(object):

    def __init__(self, grid, gamma, actions):
        self.grid = grid
        self.gamma = gamma
        self.num_states, self.num_actions = grid[0]
        self.actions = actions
        self.rewards = grid[-1]

        self.print_attrs()

    def print_attrs(self):
        print "number of states: {}\n".format(self.num_states)
        print "number of possible actions: {}\n".format(self.num_actions)
        print "rewards per state: {}\n".format(self.rewards)

    def Reward(self):
        return reward[state]

    def T(state, action, next_state):
        """ returns probability of going to state X from state Y """
        return self.actions[action][state][next_state]

    def Q(state, action) :
        total = 0
        for state in self.grid:
            for action in self.actions:
                total = total + T(state, action, next_state) * (Reward(state, action, next_state) + gamma*value[state])
        return total


if __name__ == '__main__':
    gamma = 0.9
    grid, actions = load_data()
    mdp = MDP(grid, gamma, actions)
