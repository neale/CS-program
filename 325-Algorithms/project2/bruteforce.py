#!/usr/bin/env python 
import sys
import time

def timing(f):
  
  def wrap(*args):
    time1 = time.time()
    ret = f(*args)
    time2 = time.time()
    print (time2-time1)*1000.0, ", "
    return ret
  return wrap


def getMinNumberOfCoins(coins, sum):
    if sum == 0:
        return 0
    
    res = sys.maxint
    for coin in coins:
        if coin <= sum: 
            res = min(res, getMinNumberOfCoins(coins, sum - coin) + 1)
            
    return res

@timing
def time_func(coins, num):
    return getMinNumberOfCoins(coins, num)

#coins = [1, 5, 10, 25, 50]
#coins = [1, 2, 6, 12, 13, 24, 37, 48, 60, 150]
coins = [x for x in range(1, 31) if x % 2 == 0 or x == 1] 
#print getMinNumberOfCoins(coins, int(sys.argv[1]), elems)
elems = []
elems.append([1, 5, 10, 25, 30, 50])
elems.append([1, 5, 10, 25, 30, 50, 60])
elems.append([1, 5, 10, 25, 30, 50, 60, 70])
elems.append([1, 5, 10, 25, 30, 50, 60, 70, 80])
elems.append([1, 5, 10, 25, 30, 50, 60, 70, 80, 90])
elems.append([1, 5, 10, 25, 30, 50, 60, 70, 80, 90])
elems.append([1, 5, 10, 25, 30, 50, 60, 70, 80, 90, 100])
elems.append([1, 5, 10, 25, 30, 50, 60, 70, 80, 90, 100, 110])
elems.append([1, 5, 10, 25, 30, 50, 60, 70, 80, 90, 100, 110, 120])

f = open('times.txt', 'a')
f.write('times for bruteforcing1 \n')
A = 10000
#A = [x for x in xrange(1, 30)]
for i in xrange(0, len(elems)):
    res = time_func(elems, A)
    f.write(str(res))
    f.write(', ')
f.write('\n')
f.close()
