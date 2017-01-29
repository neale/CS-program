import numpy as np
import matplotlib.pyplot as plt
import operator
import sys
import intertools, functools
import collections
def load_data():

    with open('./train.csv', 'rb') as f:
        train = f.readlines()
        train = [line.strip('\n') for line in train]
        for i, line in enumerate(train):
            train[i] = [float(n) for n in train[i].split(',')]
        train = np.array(train)

    # train[] now is a numpy array of n_samples x n_features

    # read in test data
    with open('./test.csv', 'rb') as f:
        test =  f.readlines()
        test =  [line.strip('\n') for line in test]
        for i, line in enumerate(test):
            test[i] = [float(n) for n in test[i].split(',')]
        test =  np.array(test)


    # images are represented in each row of pixels
    return train, test

class DT(object):

    def __init__(self, train, test, params):
        self.train = np.array(train)
        self.val   = np.array(test)
        self.params = params
        generate_labels(self)

    def generate_labels(self):
        """
        Dataset contains:
            x1: head shape ∈ round, square, octagon
            x2: body shape ∈ round, square, octagon
            x3: is smiling ∈ yes, no
            x4: holding ∈ sword, balloon, flag
            x5: jacket color ∈ red, yellow, green, blue
            x6: has tie ∈ yes, no
        Label: (x6 == 1)  and (x1 != x2)
        """
        for i in self.train:
            if (i[6] is 1) and (i[0] != i[2]):
                np.append(i, 1)
            else:
                np.append(i, 0)
        for i in self.val:
            if (i[6] is 1) and (i[0] != i[2]):
                np.append(i, 1)
            else:
                np.append(i, 0)

    def decision_tree(self, attributes, target, fitness):
        """
        Returns a new decision tree based on the examples given.
        """
        vals    = [record[target] for record in self.train]
        for ex in self.train:
            label.append(ex[-1])
        default = majority_value(data, target)

        counter = collections.Counter(train[:,-1])
        defaullt = counter.most_common(1)[0][0]

        if not data or (len(attributes) - 1) <= 0:
            return default
        elif vals.count(vals[0]) == len(vals):
            return vals[0]
        else:
            best = choose_attribute(data, attributes, target, gain)
            tree = {best:{}}

            for val in get_values(self.train, best):
                # Create a subtree for the current value under the "best" field
                self.subtree = decision_tree(attributes, target, fitness)

                tree[best][val] = subtree

        return tree

if __name__ == '__main__':
    train, test = load_data()
