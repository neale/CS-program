import csv
import numpy as np


class Builder(object):

    def __init__(self, n, spots_taken, path):

        self.n = n #spots in each row
        self.filled = spots_taken #percentage of spots taken
        self.path = path
        self.actions = 3
        self.

    """ 
     O = T/F     ; whether the spot is taken or not
     P = T/F     ; whether your car is parking there
     L = 1 .. 2n ; Location index
    """

    def build(self):
        
        # state order:
        # (L, O, P) ->
        # (i, T, F)  (i, F, T)  (i, T, T)  (i, F, F) -> i+1 -> ...
        
        with open(path, 'wb') as csvfile:
            writer = csv.writer(csvfile, delimiter=' ')
            
            """ Header of n_states and n_actions """
            writer.writerow([self.n*8, self.actions])
            writer.writerow()
            
            """
            Here we need blocks of states
            there will be three main blocks representing each action
            Each block will be n*8 x n*8. This is huge
            Because each parking spot number can be in two rows, 
            Each can have different values of O and P
            """

            scale = range(1,n+1)
            """ DRIVE action """
            # given the drive action, we can always move to the next spot in line
            for i in range(n*8):
                row = [0] * (n*8)
                if (i+4 > (n*8-1)) : idx = (i+4) - (n*8)
                else:            idx = i+4
                row[idx] = 1
                writer.writerow(row)
            writer.writerow()

            """ EXIT action """
            for i in range(n*8):
                writer.writerow([0]*self.n)
            writer.writerow()

            """ PARK action """
            # agent can only park it its local group. 
            # were only going to consider states 4 at a time, since they constitute a group
            # There is 0% p of parking in 1 and 4. 3 is a wreck, 2 is open
            # 3 is more probable closer, 2 is more probable when farther from store
            start_p = 
            probs = [
            for spot, state in enumerate(xrange(self.n*8)[::4]):
                row = [0]*(self.n*8)
                if state < self.n: # row B
                    row[state+1] = 1./(scale[-1*(spot+1])
                    row[state+1] = 1./(scale[-1*(spot+1)])
                else: # row A
                    row

            """ Reward """
            # everything gets a default of -1 for driving
            reward = [-1]*(self.n*8) 
            # every third state tuple is ( _ T T ) -> crash -10
            reward = [-10 if i in xrange(2, self.n*8)[::4] else s for i, s in enumerate(reward)]
            # scale positive reward by distance (x, F, T)
            for sx, rx in enumerate(xrange(1, n*8)[::4]):
                if rx < 40: # still on row B - states 0 - 4n
                    reward[rx] = scale[sx]
                else: # on row A - states 4n - 8n   
                    reward[rx] = scale[sx-self.n]
            # out of the four varients of a state : we want -1, +, -10, -1 reward
            writer.writerow(reward) 


