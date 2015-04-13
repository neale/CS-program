import matplotlib.pyplot as plt
import numpy as np

x = np.array([.0095, .0095, .0093, .0095, .0111, .0093, .0097, .0093, .0094, .0096])
y = np.array([.016, .021, .024, .022, .030, .366, 3.845, 44.85, 493, 5280])

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
        

