#!/usr/bin/env python 
from random import randint
import time
import sys

def timing(f):
  
  def wrap(*args):
    time1 = time.time()
    ret = f(*args)
    time2 = time.time()
    print "%s function took %f ms" % (f.func_name, (time2-time1)*1000.0)
    return ret
  return wrap

def enumerate(elems):
    subSize = 1
    start = 0
    largest=-(2**63-1)
    while subSize <= len(elems):
        subArr = elems[start:start+subSize]
        sum = 0
        for y in subArr:
            sum += y
            if sum > largest:
                largest = sum
        start += 1
        if start + subSize > len(elems):
            subSize += 1
            start = 0
    if largest > 0:
        return largest
    else:
        return 0

@timing
def time_func(elems):
    return enumerate(elems)

elems = [randint(-20, 20) for x in range(0, int(sys.argv[1]))]
print "running\n", "passing: ", elems, "\noutput: ", time_func(elems)

