def maxCrossing(arr, low, mid, high):
    sum=0
    maxLeft = maxRight = 0
    leftSum = -(2**63 - 1)
    for x in range(mid, 0, -1):
        sum += arr[x]
        if sum > leftSum:
            leftSum = sum
            maxLeft = x
    rightSum = -(2**63 - 1)
    sum = 0
    for x in range(mid+1, high+1, 1):
        sum += arr[x]
        if sum > rightSum:
            rightSum = sum
            maxRight = x
    return (maxLeft, maxRight, leftSum + rightSum)

def recursiveSubArray(arr, low, high):
    if abs(low-high) <= 1:
        return (low, high, arr[low])
    print "Low: " + str(low)
    print "High: " + str(high)
    mid = (low + high) / 2
    left = recursiveSubArray(arr, low, mid)
    right = recursiveSubArray(arr, mid+1, high-1)
    cross = maxCrossing(arr, low, mid, high-1)
    if left[2] >= right[2] and left[2] >= cross[2]:
        return left
    elif right[2] >= left[2] and right[2] >= cross[2]:
        return right
    else:
        return cross
        
def divide(arr, low, high):
    return recursiveSubArray(arr, low, high)[2]
##
elems = [-3, 4, 9, 18, -20, 3, 5, -7]
print elems, '\n'
print "#### recursion...: " + str(divide(elems, 0, len(elems)))
