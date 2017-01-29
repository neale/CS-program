import sys
import timeit

def fib_iter(n):
    time = timeit.Timer()
    first = 0
    second = 1
    for i in range(1, n+1):
            first, second = second, first + second
    return [first, time.timeit()]

print fib_iter(int(sys.argv[1]))

