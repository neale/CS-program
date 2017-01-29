import numpy as np
import matplotlib.patches as mpatches
import matplotlib.pyplot as plt

colors = np.random.rand(50)

# KNN ERROR PER K VALUE """
plt.figure()
plt.xlabel("KNN K value")
plt.ylabel("Training accuracy")
plt.title("KNN error by varying K")
# error on training data
X = np.array([1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25])
Y = np.array([93.571, 95.285, 97.14, 93.92, 95.0, 92.14, 93.57, 92.5, 93.214, 93.928, 91.428, 93.214, 92.857])
# error on leave one out training
A = np.array([1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25])
B = np.array([92.957, 94.718, 95.77, 95.07, 95.42, 94.01, 93.3, 93.3, 92.95, 92.6, 92.6, 92.957, 92.957])
# Error on testing data
C = np.array([1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25])
D = np.array([89.78, 90.84, 92.25, 92.60, 92.95, 91.19, 90.85, 90.14, 89.78, 89.43, 89.43, 89.78, 89.38])
plt.plot(X, Y, 'm--', label='training_accuracy')
plt.plot(A, B, 'g', label='leave one out accuracy')
plt.plot(C, D, 'b', label='test data accuracy')
plt.legend(bbox_to_anchor=(0., 1.02, 1., .102), loc=1,ncol=3, mode="expand", borderaxespad=0.)

plt.show()
