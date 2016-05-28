import operator
import numpy as np
import matplotlib.pyplot as plt
import itertools, functools

'''
Psuedocode-like Python for Policy Iteration (see the textbook)

Your assignment:
    Write a function implementing value iteration (using policyiteration below as example)
    Run it on the party problem
        Print out the value function after each sweep
    Due Tuesday October 19th, the day that Chapter 5 reading is due
'''

from partyMDP import partyMDP, Snames, Anames
'''
partyMDP is a five tuple (S,A,gamma,P,R):
    S      the set of states as a list
    A      the sets of actions for each state as a list of lists
    gamma  the discount rate
    P      the state transition probabilities as a function -- P(s,a,sp)
    R      the expected rewards as a function -- R(s,a,sp)
'''

def load_data():
    with open('rldata.csv', 'rb') as f:
        data = f.readlines()

def Q(s,a,V,mdp):
    '''Action value for s,a corresponding to state-value function V, in given MDP'''
    (S,A,gamma,P,R) = mdp
    sum = 0
    for sp in S:
        sum = sum + P(s,a,sp) * (R(s,a,sp) + gamma*V[sp])
    return sum

def greedy(s,V,mdp):
    '''Return first greedy action for state s given state values V, in given MDP'''
    (S,A,gamma,P,R) = mdp
    maxaction = A[s][0]
    maxvalue = Q(s,maxaction,V,mdp)
    for a in A[s][1:]:
        value = Q(s,a,V,mdp)
        if value > maxvalue:
            maxaction = a
            maxvalue = value
    return maxaction

def prettyprint(seq):
    '''print the sequence in a more readable way'''
    print '   ',
    for e in seq:
         print stri(e,5),
    print

def stri(x,width):
    '''Like str(x) but return a string of exactly width characters'''
    return (str(x)+' '*width)[:width] # there's probably an easier way...

def valueiteration(mdp,theta=0.001):
    '''Finds a policy that is optimal within theta for the MDP'''
    (S,A,gamma,P,R) = mdp
    prettyprint(Snames)
    V = [0 for s in S]
    
    # your code here
    print
    prettyprint(Snames)
    prettyprint([Anames[pi[s]] for s in S])
    return pi

print 'Policy iteration'
pi = policyiteration(partyMDP)
print 'Value iteration'
pi = valueiteration(partyMDP)

# hints for debugging:
#   "from partyMDP import *" will give access to the partyMDP variables
#   a judiciously placed "global V,pi" will give you access to them too
#   try help() in interactive mode ($ python -i)


if __name__ == '__main__':
    pass
