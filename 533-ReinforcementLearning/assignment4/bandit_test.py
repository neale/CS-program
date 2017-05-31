
import sys
import numpy as np
from bandit import Bandit
from banditmethods import BanditMethods, IncrementalUniform, EGreedy, UCB

def b1():

    arms = 10
    rewards = [
		[0.05, 1.], [0.05, 1.], [0.05, 1.],
		[0.05, 1.], [0.05, 1.], [0.05, 1.],
		[0.05, 1.], [0.05, 1.], [0.05, 1.],
		[1., .1]
	      ]
    rewards = np.array(rewards)
    return arms, rewards

def b2():

    arms = 20
    rewards = np.empty((20, 2))
    for i in range(len(rewards)):
        rewards[i] = np.array([(i+1.)/20, 0.1])
    return arms, rewards

def run_algo_bandit(algo, bandit):

    MethodParent = BanditMethods(bandit)
    if algo == "uniform":
        obj = IncrementalUniform(bandit)
    if algo == "ucb":
        obj = UCB(bandit)
    if algo == "greedy":
        obj = EGreedy(bandit)
    obj.run()
    return obj

# E[Reg] = n x R* - Sum(E[r])
def test(algo, bandit="ALL", trials=3):

    arms1, r1 = b1()
    arms2, r2 = b2()

    banditA = Bandit(arms1, r1)
    banditB = Bandit(arms2, r2)

    if bandit == 'A':
        bandit = banditA
    else:
        bandit = banditB

    mean_c_regret = []
    mean_s_regret = []
    for i in range(trials):
        print "trial : {}".format(i)
        b = run_algo_bandit(algo, bandit)
        mean_c_regret.append(b.c_regret)
        mean_s_regret.append(b.s_regret)
    mean_s_regret = np.mean(np.array(mean_s_regret), axis=0)
    print mean_s_regret.shape
    mean_c_regret = np.mean(np.array(mean_c_regret), axis=0)
    return mean_c_regret, mean_s_regret, np.arange(trials)



