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

def max_crossing_subarray(lst, low, mid, high):

    leftsum = -sys.maxint
    maxright, maxleft = 0, 0    
    sum = 0
    for i in range(mid, low-1, -1):
        sum += lst[i]
        if sum > leftsum:
            leftsum = sum
            maxleft = i
    rightsum = -sys.maxint
    sum = 0
    for j in range(mid + 1, high):
        sum += lst[j]
        if sum > rightsum:
            rightsum = sum
            maxright = j
    totalSum = 0
    if leftsum > 0:
        totalSum += leftsum
    if rightsum > 0:
        totalSum += rightsum
    return (maxright, maxleft, totalSum)

def max_subarray(lst, low, high):
    if high == low:
        return (low, high, lst[0])
    else: 
      mid = (low+high)//2
      (leftlow, lefthigh, leftsum) = max_subarray(lst, low, mid)
      (rightlow, righthigh, rightsum) = max_subarray(lst, mid+1, high)
      (crosslow, crosshigh, crosssum) = max_crossing_subarray(lst, low, mid, high)
    if (leftsum >= rightsum) and (leftsum >= crosssum):
      return (leftlow, lefthigh, leftsum)
    elif (rightsum >= leftsum) and (rightsum >= crosssum):
      return (rightlow, righthigh, rightsum)
    else: 
      return (crosslow, crosshigh, crosssum)

@timing
def call_for_time(lst, start, end):
    return max_subarray(lst, start, end)


lst = [randint(-10, 10) for x in range(0, int(sys.argv[1]))]
idx = call_for_time(lst, 0, len(lst))
subarr = [lst[i] for i in range(idx[1], idx[0]+1)]
print lst, '\n', subarr, '\nsum: ', idx[2]
