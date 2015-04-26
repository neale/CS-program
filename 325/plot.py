import matplotlib.pyplot as plt
import numpy as np

#project 1 algorithms 1-4
w = np.array([.017, .033, .132, .716, 3.697, 22.931, 324.724, 1927.502, 145405, 10197.965, 1170605.957])  
x = np.array([.013, .048, .845, .143, 3.895, 44.312, 229.968, 2182.506, 14950.93, 179258.975, 1102054.834])
y = np.array([.017, .041, .067, .503, .299, 1.356, 6.508, 14.943, 62.023, 372.541, 743.566])
z = np.array([.010, .018, .023, .079, .146, .704, 1.412, 9.417, 17.012, 73.113, 64.674])

plt.subplot(2, 1, 1)
plt.title("Max Subarray Algorithm Runtimes")
plt.ylabel("Computation time (s))")
plt.xlabel("Size of input set (N)")

plt.plot(w, "-yo")
plt.plot(x, "-r")
plt.plot(y, "-g")
plt.plot(z, "-b")
plt.show()
        

