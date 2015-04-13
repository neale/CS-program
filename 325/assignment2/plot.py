import matplotlib.pyplot as plt
import numpy as np
## assignment 1
## 5, 10, 15, 20, 25, 30, 35, 40, 45, 50
x = np.array([.0095, .0095, .0093, .0095, .0111, .0093, .0097, .0093, .0094, .0096])
y = np.array([.016, .021, .024, .022, .030, .366, 3.845, 44.85, 493, 5280])

## assignment 2

x = np.array([.191, .197, .195, .263, 60.77
y = np.array([.190, .191, .193, .269, 60.98

plt.subplot(2, 1, 1)
plt.title("Fibonacci sequence implementations")

plt.plot(x, "-yo")
plt.xlabel("Number in sequence")
plt.ylabel("Iterative computation time (s))")

plt.subplot(2, 1, 2)
plt.plot(y, "-r")
plt.xlabel("Number in sequence")
plt.ylabel("Recursive computation time (s))")

plt.show()
        

