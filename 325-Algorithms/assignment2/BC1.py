import matplotlib.pyplot as plt
import numpy as np
import scipy.misc
import sys

def BC1(n, k):
    if k == 0: return 0
    if k == n: return 1
    return BC1(n-1, k) + BC1(n-1, k-1)

n = float(sys.argv[1])
k = int(n/2)
print BC1(n, k)


