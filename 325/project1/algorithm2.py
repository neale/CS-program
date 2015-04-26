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

def enumerateCache(elems):
    subSize = 1
    start = 0
    largest=-(2**63 - 1)
    #Dictionary that will hold key, value of str index : sum
    previous = {}
    previous['[]'] = 0
    while subSize <= len(elems):
        sum = 0
        #Sub-array we're after
        subArr = elems[start:start+subSize]
        #String representation of sub array up to index-1
        prevIndex = str(str(start) + ':' + str(start+subSize-1))
        doIterate = True
        #If we have a cached value, retrieve it and add our single index and we're done
        if prevIndex in previous:
            #Get our cached result of position - 1 and just add the next val
            sum = previous[prevIndex] + elems[start+subSize-1]
            doIterate = False
        #No cache hit -- iterate, sum and store in cache
        if doIterate:
            for y in subArr:
                sum += y               
            if str(subArr) not in previous:
                previous[str(start) + ':' + str(start+subSize)] = sum
        if sum >= largest:
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
    return enumerateCache(elems)

elems = [randint(-20, 20) for x in range(0, int(sys.argv[1]))]
print "running\n", "passing: ", elems, "\noutput: ", time_func(elems)
