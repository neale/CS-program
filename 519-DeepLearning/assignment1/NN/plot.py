import matplotlib.pyplot as plt
import numpy as np
## assignment 1
## 5, 10, 15, 20, 25, 30, 35, 40, 45, 50
n = np.array([5, 10, 20, 50])
m = np.array([48., 61., 52, 43])
plt.plot(n, m, '.b-')
plt.xlabel("Number of Hidden Units")
plt.ylabel("Percentage Accuracy on Test Set")
plt.title("Hidden Units on Test Accuracy")
plt.show()
        

