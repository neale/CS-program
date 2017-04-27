import sys
import operator
import numpy as np
import matplotlib.pyplot as plt
import itertools, functools
import re
import argparse
from mdp_builder import Builder
""" Grid Layout
    grid[0][0] = num_states
    grid[0][1] = num_actions
"""
def load_args():

  parser = argparse.ArgumentParser(description='Description of your program')
  parser.add_argument('-t', '--timesteps', default=0, help='horizon length, discarded if discount provided', required=False)
  parser.add_argument('-g', '--gamma', default=0, help='discount factor', required=False)
  parser.add_argument('-f', '--input_file', default='MDP1.txt', help='input file with MDP description')
  parser.add_argument('-e', '--epsilon', default=0, help='epsilon, or early stopping conditions', required=False)
  parser.add_argument('-i', '--intermediate', default=False, type=bool,  help='print out intermeiate policies/value functions while it learns', required=False)
  parser.add_argument('-b', '--build', default=False, type=bool, help='use the parking lot planner')
  parser.add_argument('-s', '--spaces', default=8, type=int, help='number of spaces in each row of the parking lot')
  parser.add_argument('-c', '--rcrash', default=-10, type=int, help='penalty on crashing into another car')
  parser.add_argument('-d', '--rdisabled', default=-5, type=int, help='penalty on parking in a handicapped spot')
  parser.add_argument('-r', '--run_trial', default=False, type=bool, help='try policy with a given starting position')


  args = parser.parse_args()
  return args

def load_data(path):

    with open(path, 'rb') as f:

        train = f.readlines()
        train = [line.strip('\n') for line in train]
        train = [re.sub(r'[^\x00-\x7f]',r'', line) for line in train]
        train[0] = [int(a) for a in train[0].split(' ')]
        num_states, num_actions = train[0]
        print num_states, num_actions
        lines = num_actions * num_states + num_actions
        grid = []

        for i in range(1, lines+(num_actions-1)):
            if ((i-1) % (num_states+1) is not 0) and (len(train)-1 >= i):
                if train[i] == "":
                    pass
                else:
                    print "line: ", train[i]
                    grid.append([float(n) for n in train[i].split(' ')])
                    train[i] = [float(n) for n in train[i].split(' ')]
        """
        start = 1
        for i in range(num_actions):
            start = (i*num_states)+1
            print "taking input from lines: {} to {}".format(start, (i+1)*num_states+2)
            for k in range(start, (i+1)*num_states+2):
                print "line ", k, " : ", train[k]
                if k == start:
                    g = 1
                else:
                    grid.append([float(n) for n in train[k].split(' ')])
                    train[k] = [float(n) for n in train[k].split(' ')]
        """

        print len(train)
        actions = []
        for i in range(num_actions):
            actions.append(grid[(i*num_states):((1+i)*num_states)])
        train = np.array(train)
    return train, actions

def build_mdp(args):

    builder = Builder(args.spaces, 0, args.rcrash, args.rdisabled, './parking.txt')
    builder.build()

class MDP(object):

    def __init__(self, args, grid, actions):
        self.args = args
        self.grid = grid
        self.gamma = float(args.gamma)
        self.num_states, self.num_actions = grid[0]
        self.actions = actions
        self.rewards = grid[-1]
        if type(self.rewards) is str:
            self.rewards = self.rewards.split(' ')
            self.rewards = map(float, self.rewards)
        self.Utility = [x for x in self.rewards]
        self.print_attrs()
        self.timesteps = int(args.timesteps)
        if (args.epsilon is 0) and (self.gamma > 0):
            self.epsilon = ((1*10**-10)*((1-self.gamma)**2))/(2*(self.gamma**2))
        else: self.epsilon = float(args.epsilon)

    def print_attrs(self):
        print "number of states: {}\n".format(self.num_states)
        print "number of possible actions: {}".format(self.num_actions)
        print "rewards per state: {}".format(self.rewards)
        print "grid: {}".format(len(grid))

    def Reward(self, state, action=None):
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
        if self.timesteps > 0:
            return max_p + self.Reward(state)
        else:
            return self.gamma*max_p + self.Reward(state)

    """
    Q iterates through the algorithm until the utility update is less than delta
    as the utility of each state is updated, the difference between the old and the
    new utility functions can be taken, this is compared against the delta equation
    """
    def Q(self) :

        max_state = 1
        if self.timesteps == 0:
            print "searching infinite horizon"
            while max_state > self.epsilon:
                max_state = 0
                new_util = [0]*self.num_states
                next_prob = []
                for state in range(self.num_states):
                    state_util = self.util(state)
                    if state_util is not None:
                        max_state = max(max_state, abs(self.Utility[state] - state_util))
                        new_util[state] = state_util
                self.Utility = new_util

        else:
            print "searching on finite horizon"
            # for finite horizon
            utilities, policies = [], []
            for it in range(self.timesteps):
                for s in range(it):
                    new_util = [0]*self.num_states
                    next_prob = []
                    for state in range(self.num_states):
                        state_util = self.util(state)
                        if state_util is not None:
                            max_state = max(max_state, abs(self.Utility[state] - state_util))
                            new_util[state] = state_util
                    self.Utility = new_util
                if self.args.intermediate:
                    print "INTERMEDIATE\n\n"
                    utilities.append(self.Utility)
                    policies.append(self.policy())

            if self.args.intermediate:
                return utilities, policies
            else:
                return self.Utility, self.policy()

        return self.Utility

    """
    finds the best policy based on the current utility function
    simply returns the best next state: next state with the highest utility
    """
    def policy(self):
        proto_policy = []
        def argmax(state):
            res = {}
            for action in range(self.num_actions):
                res[action] = 0
                self.p_states = []
                for next_state in range(self.num_states):
                    self.p_states.append((self.T(state, action, next_state), action, next_state))
                for p in self.p_states:
                    res[action] += p[0] * self.Utility[p[2]]
            return (max(res.items(), key=operator.itemgetter(1))[0] if res else None)
        for state in range(self.num_states):
            proto_policy.append(argmax(state))
        return proto_policy

    def run_trial(self, U, P, start):

        state = start
        reward = 0
        i = 0
        for action in P:
            print "STEP {}".format(i)
            if int(float(action)) == 0: #park
                reward += self.rewards[state]
                print "TAKING EXIT\n\nReward of {}\n\nDONE".format(reward)
                return
            if int(float(action)) == 1:
                print "EXITING\n\nReward of {}\n\nDONE".format(reward)
                return
            if int(float(action)) == 2:
                reward -= 1
                if state < 40:
                    state += 3
                else:
                    state = 0
                i += 1


if __name__ == '__main__':
    args = load_args()
    if args.build == True:
      build_mdp(args)
      sys.exit(0)

    grid, actions = load_data(args.input_file)
    mdp = MDP(args, grid, actions)
    if int(args.timesteps) > 0: finite = True
    else: finite = False

    if finite is False:
      Utility = mdp.Q()
      Policy = mdp.policy()
      U = ["%.5f" % v for v in Utility]
      P = ["%.5f" % v for v in Policy]
      print "**************************************\nPolicy: {}\nValue : {}\n**************************************".format(P, U)
      if args.run_trial:
          start = 1
          print "\n\nRUNNING POLICY STARTING AT STATE {}".format(start)
          mdp.run_trial(U, P, start)
    else:
      print "***********************************"
      Utility, Policy = mdp.Q()
      if args.intermediate:
          for i in range(int(args.timesteps)):
              U = ["%.5f" % v for v in Utility[i]]
              print U
          for i in range(int(args.timesteps)):
              P = ["%.5f" % v for v in Policy[i]]
              print P
      else:
          U = ["%.5f" % v for v in Utility]
          P = ["%.5f" % v for v in Policy]
          print "Finite Utility : {}".format(U)
          print "Finite Policy  : {}\n".format(P)

