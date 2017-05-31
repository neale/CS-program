import numpy as np


class Bandit(object):

    def __init__(self, n, rewards=None):

        self.arms = n
        if rewards is None:
            self.rewards = np.zeros(n)
            for reward in self.rewards:
                reward = np.zeros(2)
        else:
            self.rewards = rewards

        self.best_arm = np.argmax([r*p for [r, p] in rewards])

    def reward(self, arm):

        r    = self.rewards[arm][0]
        prob = self.rewards[arm][1]
        choice = sum(np.random.binomial(1, prob, 1))
        
        if int(choice) == 1:
            reward = r
        else:
            reward = 0
        return reward

    def pull_expected(self, arm):

        expected = self.rewards[arm][0] * self.rewards[arm][1]
        return expected

