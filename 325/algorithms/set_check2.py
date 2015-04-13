from random import randint


def set_check2(S, x):
    
    X = []
    Y = []
    Z = []
    print 'int = ', x
    S.sort() #O(n)
    L = [x-i for i in S] #O(nlg(n))
    print 'S: ', S, '\n', 'L: ', L, '\n'
    for i in S:
        if i not in X:
            X.append(i)
    for i in L:
        if i not in Y:
            Y.append(i)
    print Y, '\n', X
    for i in range(0, len(X)):
        Z.append([X[i], Y[i]])
    print '\n', Z

x = randint(0, 9)
S = [randint(0, 9) for i in range(0, 9)]
set_check2(S, x)
