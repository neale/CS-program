#!/usr/bin/env python 
import sys

def getMinNumberOfCoins(coins, sum):
    if sum == 0:
        return 0
    
    res = sys.maxint
    for coin in coins:
        if coin <= sum: 
            res = min(res, getMinNumberOfCoins(coins, sum - coin) + 1)
            
    return res;

f = open('times.txt', 'a')
f.write('times for bruteforcing \n')
elems = [1, 5, 10, 25, 50]
A = [x for x in range(2010, 2200) if x % 5 == 0]
for i in xrange(0, len(A)):
    res = getMinNumberOfCoins(elems, A[i])
    f.write(str(res))
    f.write(', ')
f.write('\n')
f.close()

