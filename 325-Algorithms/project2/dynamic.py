import time

def timing(f):
  
  def wrap(*args):
    time1 = time.time()
    ret = f(*args)
    time2 = time.time()
    diff = (time2 - time1) * 1000.0
    print diff
    return ret, diff 
  return wrap


def changedpChen(elems, A):
    length = len(elems)
    elemnum = [0 for i in range (length)]
    minCoins = [[0 for j in range(A + 1)] for i in range(len(elems))]
    minCoins[0] = range(A + 1)

    for i in range(1,len(elems)):
        for j in range(0, A + 1):
            if j < elems[i]:
                minCoins[i][j] = minCoins[i-1][j]
            else:
                minCoins[i][j] = min(minCoins[i-1][j], 1 + minCoins[i][j-elems[i]])


    while((i>=1)and(j>=0)):
        if minCoins[i][j] == minCoins[i-1][j]:
            i = i - 1
            if i ==0:
                elemnum[i] = elemnum[i] + minCoins[i][j]
                return minCoins[-1][-1],elemnum 
        else:
            elemnum[i] = elemnum[i] + 1
            j = j - elems[i]
    return minCoins[-1][-1],elemnum

@timing
def time_func(elems, A):
    return changedpChen(elems, A)


f = open('times.txt', 'a')
#f.write('times for changedp\n')
f.write('times for changedp3_real\n')

#elems = [1, 5, 10, 25, 50]
#elems = [1, 2, 6, 12, 13, 24, 37, 48, 60, 150]
#elems = [x for x in xrange(1, 31) if x % 2 == 0 or x == 1]
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


#A = [x for x in xrange(1, 30)]

#A = [x for x in range(2010, 2200) if x % 5 == 0]
#A = [x for x in range(10000, 10100)]
A = 10000
for i in xrange(0, len(elems)):
    res = time_func(elems[i], A)
    f.write(str(res[0]))
    f.write(', ')
f.write('\n')
f.close()

