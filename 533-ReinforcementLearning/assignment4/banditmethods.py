import sys
import numpy as np
from bandit import Bandit


class BanditMethods(object):

    def __init__(self, bandit):
        self.arms   = bandit.arms
        self.bandit = bandit
        self.total_reward = 0
        self.totals = np.zeros(bandit.arms)
        self.mean_reward = np.zeros(self.arms)
        self.total_pulls = 0
        self.c_reward = []
        self.n_pulls = np.zeros(self.arms)
        self.optimal_rewards = []
        self.c_regret = []
        self.s_regret = []
        self.optim_arm = 0
        self.R = 0

    def pull(self):
        pass

    def update(self, arm):

        reward = self.bandit.reward(arm)
        self.total_reward += reward
        self.totals[arm] += reward
        self.mean_reward[arm] = self.totals[arm] / self.total_pulls
        self.n_pulls[arm] += 1

        R = self.bandit.pull_expected(self.bandit.best_arm)
        r1 = self.total_pulls * R
        r2 = r1 - self.total_reward
        #print "expected : ", r1
        #print "cum r    : ", self.total_reward
        self.c_regret.append(r2)
        
        expected_arm = self.optim_arm
        #print "e arm : ", expected_arm
        expected_reward = self.bandit.pull_expected(expected_arm)
        #print "e rewv: ", expected_reward
        self.s_regret.append(R - expected_reward)

class IncrementalUniform(BanditMethods):

    def __init__(self, bandit):

        self.bandit = bandit
        self.total_reward = 0
        self.totals = np.zeros(bandit.arms)
        self.c_reward = []
        self.mean_reward = np.zeros(bandit.arms)
        self.total_pulls = 0
        self.arms = bandit.arms
        self.optim_arm = 0
        self.n_pulls = np.zeros(self.arms)
        self.optimal_rewards = []
        self.c_regret = []
        self.s_regret = []
        self.R = 0


    def pull(self, arm):
        self.optim_arm = self.bandit.best_arm
        self.update(arm)

    def run(self, it=2000000):

        self.total_pulls = 1
        while self.total_pulls < it :
            if self.total_pulls%10000 == 0:
                print self.total_pulls
            self.total_pulls += 1
            self.pull(self.total_pulls%self.arms)

    def get_best_arm(self):

        return argmax(self.mean_reward)


class UCB(BanditMethods):

    def __init__(self, bandit):

        self.bandit = bandit
        self.arms = bandit.arms
        # we want to save average reward for each arm
        self.totals = np.zeros(bandit.arms)
        self.mean_reward = np.zeros(bandit.arms)
        self.total_reward = 0
        self.n_pulls = np.ones(bandit.arms)
        self.total_pulls = 0
        self.c_reward = []
        self.optim_arm = 0
        self.optimal_rewards = []
        self.c_regret = []
        self.s_regret = []
        self.R = 0


    def pull(self):

        vals = []
        for arm in range(self.arms):
            ave = self.mean_reward[arm]
            log = 2. * np.log(self.total_pulls)
            exp = np.sqrt(log/self.n_pulls[arm])
            vals.append( ave + exp )
        arm = np.argmax(vals)
        self.optim_arm = np.argmax(self.mean_reward)
        #print self.optim_arm
        self.update(arm)

    def get_best_arm(self):

        return np.argmax(self.Q)

    def run(self, it=2000000):

        #action is argmax q + sqrt(2ln(n))/n(a))
        for n in xrange(1, it):
            if n%1000==0: print n
            self.total_pulls += 1
            self.pull()

class EGreedy(BanditMethods):

    def __init__(self, bandit):

        self.bandit = bandit
        self.total_reward=0
        self.epsilon = .5
        self.totals = np.zeros(bandit.arms)
        self.mean_reward = np.zeros(bandit.arms)
        self.n_pulls = np.ones(bandit.arms)
        self.total_pulls = 0
        self.arms = bandit.arms
        self.c_reward = []
        self.optim_arm = 0
        self.optimal_rewards = []
        self.c_regret = []
        self.s_regret = []
        self.R = 0


    def pull(self, arm):
        self.optim_arm = arm
        self.update(arm)

    def run(self, it=2000000):

        self.total_pulls = 1
        while self.total_pulls < it:
            self.total_pulls += 1
            if self.total_pulls%10000==0:
                print self.total_pulls
            if sum(np.random.binomial(1, self.epsilon, 1)) == 0.:
                self.pull(self.total_pulls%self.arms)
            else:
                randarm = np.random.randint(10)
                self.pull(randarm)

    def get_best_arm(self):

        return np.argmax(self.mean_reward)

