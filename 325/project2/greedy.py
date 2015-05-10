def changegreedy(elems,A):
    length = len(elems)
        elemnum = [0 for i in range (length)]
        for i in range(len(elems))[::-1]:
            while (elems[i] <= A):
                A = A - elems[i]
                        elemnum[i] += 1

        max = sum(elemnum)
        return max,elemnum

f = open('times.txt', 'a')
f.write('answers for greedy\n')
elems = [1, 5, 10, 25, 50]
A = [x for x in range(2010, 2200) if x % 5 == 0]
for i in xrange(0, len(A)):
    res = getMinNumberOfCoins(elems, A[i])
    f.write(str(res[0]))
    f.write(', ')
f.write('\n')
f.close()

