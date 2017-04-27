import sys
import operator
import numpy as np
import matplotlib.pyplot as plt
import itertools, functools
import re
import argparse
""" Grid Layout
    grid[0][0] = num_states
    grid[0][1] = num_actions
"""
def load_args():

  parser = argparse.ArgumentParser(description='Description of your program')
  parser.add_argument('-t', '--timesteps', default=0, help='horizon length, discarded if discount provided', required=False)
  parser.add_argument('-g', '--gamma', default=0, help='discount factor', required=False)
  parser.add_argument('-f', '--input_file', default='MDP1.txt', help='input file with MDP description', required=True)
  parser.add_argument('-e', '--epsilon', default=0, help='epsilon, or early stopping conditions', required=False)
  parser.add_argument('-i', '--intermediate', default=False, type=bool,  help='print out intermeiate policies/value functions while it learns', required=False)
  parser.add_argument('-d', '--drive', default=False, type=bool, help='use the parking lot planner')
  parser.add_argument('-s', '--spaces', default=8, type=int, help='number of space in the two rows of the parking lot')

  args = parser.parse_args()
  return args

def load_data(path):

    with open(path, 'rb') as f:
        train = f.readlines()
        train = [line.strip('\n') for line in train]
        train = [re.sub(r'[^\x00-\x7f]',r'', line) for line in train]
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

def load_drive_args(args):

    spaces = args.spaces
    actions = [0, 1, 2] #park, drive, exit

    # state space is a bunch of tuples that we move between
    
    state_space = [
               (0, True, False),  (0, False, False),  (1, True, False),  (1, False, False), 
               (2, True, False),  (2, False, False),  (3, True, False),  (3, False, False), 
               (4, True, False),  (4, False, False),  (5, True, False),  (5, False, False),  
               (6, True, False),  (6, False, False),  (7, True, False),  (7, False, False), 
               (8, True, False),  (8, False, False),  (9, True, False),  (9, False, False), 
               (10, True, False), (10, False, False), (11, True, False), (11, False, False), 
               (12, True, False), (12, False, False), (13, True, False), (13, False, False), 
               (14, True, False), (14, False, False), (15, True, False), (15, False, False)
            ]
    
    # create parking spot holes in the state space
    spaces = [

    reward = [-1, -1, -1, -1, -1, -1, -1, -1,
           -1, -1, -1, -1, -1, -1, -1, -1 ]



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
        print "actions: {}\n".format(self.actions)
        print "rewards per state: {}".format(self.rewards)
        print "rewards: {}\n".format(self.rewards)

    def Reward(self, state, action=None):
        if self.driving:
            if action == 0 : #drive
                return -1
            elif action == 1: #park
                return self.lotreward[state]
            elif action == 2: #exit
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

    """ A[1] B[1]
        A[2] B[2]
        ........
        A[n] B[n]

        Circular states where driving is done in a ring. A2 -> A1 -> B1 -> B2 -> .. -> Bn -> An -> .. -> A2
    """
    def drive(self):

        row_spaces = self.rowlen * 2
        if self.position != self.rowlen*2:
            self.position = self.position+1
        else:
            self.position = 0




    if __name__ == '__main__':
      args = load_args()
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
              
