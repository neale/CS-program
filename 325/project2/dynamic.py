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

f = open('times.txt', 'a')
f.write('times for changedp\n')
elems = [1, 5, 10, 25, 50]
A = [x for x in range(2010, 2200) if x % 5 == 0]
for i in xrange(0, len(A)):
    res = changedpChen(elems, A[i])
    f.write
    f.write(str(res[0]))
    f.write(', ')
f.write('\n')
f.close()

