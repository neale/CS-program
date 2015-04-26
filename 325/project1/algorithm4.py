from random import randint
import sys
import time

def timing(f):
  def wrap(*args):
    time1 = time.time()
    ret = f(*args)
    time2 = time.time()
    print "%s function took %f ms" % (f.func_name, (time2-time1)*1000.0)
    return ret
  return wrap

def long(lst):
    if(len(lst) == 0):
        return 0
    if(max(lst) < 0):
        return []
    maxSum, tempSum, start, end = 0, 0, 0, 0
    for i in lst:
        index = lst[i]
        if(tempSum):
            if(tempSum + i == max(maxSum, tempSum+i, i)):
                end = index + 1
                maxSum = tempSum + i
                tempSum = 0
            if(maxSum == max(maxSum, tempSum + i, i)):
                tempSum += i
            if(i == max(maxSum, tempSum+i, i)):
                start = index
                end = index + 1
                maxSum = i
                tempSum = 0
        else:
            if(i > 0):
                end = index + 1
                maxSum += i
            if(i < 0):
                tempSum = maxSum + i
    return maxSum
    
@timing
def time_func(elems):
    return long(elems)

elems = [randint(-20, 20) for x in range(0, int(sys.srgv[1]))]
print "running\n", "passing: ", elems, "\noutput: ", time_func(elems)

