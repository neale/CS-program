#!/usr/bin/env python 
import matplotlib.pyplot as plt
import numpy as np

#project 1 algorithms 1-4
w = np.array([.017, .033, .132, .716, 3.697, 22.931, 324.724, 1927.502, 145405.554, 1170605.957])  
x = np.array([.013, .048, .845, 1.143, 3.895, 44.312, 229.968, 2182.506, 14950.93, 179258.975])
y = np.array([.017, .041, .067, .503, .299, 1.356, 6.508, 14.943, 62.023, 372.541])
z = np.array([.010, .018, .023, .079, .146, .704, 1.412, 9.417, 17.012, 73.113])

yz_ticks = ['1', '10', '50', '100', '500', '1000', '5000', '10000', '50000', '100000']
wx_ticks = ['1', '10', '25', '50', '100', '250', '500', '1000', '2500', '5000']

#plt.subplot(5, 1, 1)
plt.figure(1)
plt.plot(w, "-yo")
plt.xticks(range(10), wx_ticks, color='black')
plt.title("Algorithm 1 Runtime")
plt.ylabel("Computation time (ms)")
plt.xlabel("Size of input set (N)")

#plt.subplot(5, 1, 2)
plt.figure(2)
plt.plot(x, "-r")
plt.xticks(range(10), wx_ticks, color='black')
plt.title("Algorithm 2 Runtime")
plt.ylabel("Computation time (ms)")
plt.xlabel("Size of input set (N)")

#plt.subplot(5, 1, 3)
plt.figure(3)
plt.plot(y, "-b")
plt.xticks(range(10), yz_ticks, color='black')
plt.title("Algorithm 3 Runtime")
plt.ylabel("Computation time (ms)")
plt.xlabel("Size of input set (N)")

#plt.subplot(5, 1, 4)
plt.figure(4)
plt.plot(z, "-g")
plt.xticks(range(10), yz_ticks, color='black')
plt.title("Algorithm 4 Runtime")
plt.ylabel("Computation time (ms)")
plt.xlabel("Size of input set (N)")

#plt.subplot(5, 1, 5)
plt.figure(5)
plt.title("All algorithms together")
plt.plot(w, "-yo")
plt.plot(x, "-r")
plt.plot(y, "-b")
plt.plot(z, "-g")
plt.xticks(range(10), yz_ticks, color='black')

plt.figure(6)
plt.title("Log Log plot of all algorithms")
plt.plot(w, "-yo")
plt.plot(x, "-r")
plt.plot(y, "-b")
plt.plot(z, "-g")
plt.yscale('log')

#plt.subplots_adjust(bottom=0.15)
plt.margins(.2)
plt.tight_layout()
plt.show()
        
