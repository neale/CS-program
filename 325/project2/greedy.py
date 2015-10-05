import time

def timing(f):
  
  def wrap(*args):
    time1 = time.time()
    ret = f(*args)
    time2 = time.time()
    print (time2-time1)*1000.0, ", "
    return ret
  return wrap


def changegreedy(elems,A):
    length = len(elems)
    elemnum = [0 for i in range (length)]
    for i in range(len(elems))[::-1]:
        while (elems[i] <= A):
            A = A - elems[i]
            elemnum[i] += 1

    max = sum(elemnum)
    return max,elemnum

@timing
def time_func(elems, A):
    return changegreedy(elems, A)


f = open('times.txt', 'a')
f.write('answers for greedy2_real\n')
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

#elems = [1, 2, 6, 12, 13, 24, 37, 48, 60, 150]

#elems = [x for x in range(1, 31) if x % 2 == 0 or x == 1] 

#A = [x for x in range(2010, 2200) if x % 5 == 0]
#A = [x for x in range(10000, 10100)]
#A = [x for x in range(1, 30)]
A = 10000
for i in xrange(0, len(elems)):
    res = time_func(elems[i], A)
    f.write(str(res[0]))
    f.write(', ')
f.write('\n')
f.close()

