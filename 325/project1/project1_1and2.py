#dcastor -- cs325 -- project 1


elems = [-3, 4, 9, 18, -20, 3, 5, -7]
elems2 = [-3, 4, 9, 18, -20, 3, 5, -7, -29, 18, 18, 18]
elems3 = [-3, 4, 8, -15, 38, 3, -30, 5, 17, 3, -4, 5, 2, 9, 1, -11, -7, -3, 4, 33, 22, -44]

from random import randint
lst = [randint(-20, 20) for x in range(0, 20)]
def enumerate(subSize, start, elems):
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
    return largest
    
    
def enumerateCache(subSize, start, elems):
    largest=-(2**63 - 1)
    #Dictionary that will hold key, value of str index : sum
    previous = {}
    previous['[]'] = 0
    while subSize <= len(elems):
        sum = 0
        #Sub-array we're after
        subArr = elems[start:start+subSize]
        #String representation of sub array up to index-1
        prevIndex = str(elems[start:start+subSize-1])
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
                previous[str(subArr)] = sum
        if sum >= largest:
            largest = sum
        start += 1
        if start + subSize > len(elems):
            subSize += 1
            start = 0
    return largest
        
    
#31    
print "##### RESULT: " + str(enumerate(1, 0, elems))
print "##### CACHED RESULT: " + str(enumerateCache(1, 0, elems))


#54
print "##### RESULT: " + str(enumerate(1, 0, elems2))
print "##### CACHED RESULT: " + str(enumerateCache(1, 0, elems2))

#87
print "##### RESULT: " + str(enumerate(1, 0, elems3))
print "##### CACHED RESULT: " + str(enumerateCache(1, 0, elems3))
