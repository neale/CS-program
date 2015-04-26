'''Describe a theta of nlg(n) time algorithm that, given a set S of n integers and another
integer x, determines whether or not there exist two elements in S whose sum is
exactly x.
'''
def set_check(S, x):
        return [[i, j] for i in S for j in S if i+j==x]

S = [1, 2, 3, 4, 5, 6, 7, 8 ,9 ,0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
print(set_check(S, 18))
