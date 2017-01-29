import matplotlib.pyplot as plt
import numpy as np
import scipy.misc
import sys

def BC2(n, k):
    if k == 0: return 1
    if k > 0: return BC2(n-1, k-1) * (n/k)
    else: return "need k > 0"

n = float(sys.argv[1])
k = int(n/2)
print BC2(n, k)


