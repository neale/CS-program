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
    #with open('./rl_testdata.csv', 'rb') as f:
        train = f.readlines()
        train = [line.strip('\n') for line in train]
        train[0] = [int(a) for a in train[0].split(' ')]
        num_states, num_actions = train[0]
        lines = num_actions * num_states + num_actions
        grid = []
        for i in range(1, lines+(num_actions-1)):
            if (i-1) % (num_states+1) is not 0:
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
        self.Utility = [x for x in self.rewards]
        self.Path = [0]
        self.print_attrs()
        self.delta = ((1*10**-10)*((1-self.gamma)**2))/(2*(self.gamma**2))

    def print_attrs(self):
        print "number of states: {}\n".format(self.num_states)
        print "number of possible actions: {}\n".format(self.num_actions)
        print "rewards per state: {}\n".format(self.rewards)

    def Reward(self, state):
        return self.rewards[state]

    def T(self, state, action, next_state):
        """ returns probability of going to state X from state Y """
        return self.actions[action][state][next_state]

    """ Value Iteration algorithm:
            U1(state) = Reward(state)
            Ui+1(state) = Reward(state) = gamma*max(for all next states (T(state, action, next_state)(U(i))))

            computes the utility of each state when considering all next states
    """
    def util(self, state):
        p_actions = []
        max_p, sum_p = 0, 0
        for action in range(self.num_actions):
            sum_p = 0
            p_actions = []
            for next_state in range(self.num_states):
                p_actions.append((self.T(state, action, next_state), action, next_state))
            for p in p_actions:
                sum_p += p[0] * self.Utility[p[2]]
            if (sum_p > max_p) or (max_p is 0):
                max_p = sum_p
        return self.gamma*max_p + self.Reward(state)

    """ Q iterates through the algorithm until the utility update is less than delta
        as the utility of each state is updated, the difference between the old and the
        new utility functions can be taken, this is compared against the delta equation
    """
    def Q(self) :

        max_state = 1
        # fill in Utility for each
        while max_state > self.delta:
            max_state = 0
            new_util = [0]*self.num_states
            next_prob = []
            for state in range(self.num_states):
                state_util = self.util(state)
                if state_util is not None:
                    max_state = max(max_state, abs(self.Utility[state] - state_util))
                    new_util[state] = state_util
            self.Utility = new_util
        return self.Utility

    """ finds the best policy based on the current utility function
        simply returns the best next state: next state with the highest utility
    """
    def policy(self):
        proto_policy = []
        def argmax(state):
            res = {}
            for action in range(self.num_actions):
                res[action] = 0
                p_states = []
                for next_state in range(self.num_states):
                    p_states.append((self.T(state, action, next_state), action, next_state))
                for p in p_states:
                    res[action] += p[0] * self.Utility[p[2]]
            return (max(res.items(), key=operator.itemgetter(1))[0] if res else None)
        for state in range(self.num_states):
            proto_policy.append(argmax(state))
        return proto_policy

if __name__ == '__main__':
    gamma = 0.1
    grid, actions = load_data()
    mdp = MDP(grid, gamma, actions)
    Utility = mdp.Q()
    Policy = mdp.policy()

    print "Utility for the last run was : {}\n\nPolicy : {}\n**************************************".format(Utility, Policy)

