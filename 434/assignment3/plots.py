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
"""
# PLOT OF FINAL LEARNING RATE ERROR
plt.figure()
plt.xlabel("Gradient Descent Iteration")
plt.ylabel("Error rate %")
plt.title("Logistic Regression Error on Test Data")
Y = np.array([50, 29.625, 49.375, 18.875, 27.375, 13, 4.75, 7.375, 9.625, 8.5, 6.625, 3.75, 3.5, 4, 4.5, 5.375, 5.75, 5.625, 5.25])
X = range(len(Y))
plt.scatter(X, Y)

# PLOT OF FINAL LEARNING RATE ERROR
plt.figure()
plt.xlabel("Gradient Descent Iteration")
plt.ylabel("Error rate %")
plt.title("Logistic Regression Error on Train Data")
Y = np.array([50, 28.7, 49.14, 16.42, 26.21, 12, 4.78, 6.0, 8.85, 8.85, 5.5, 4.0, 2.78, 2.42, 2.92, 3.85, 4.07, 4.14, 4.35])
X = range(len(Y))
plt.scatter(X, Y)

# PLOT OF LAMBDA
plt.figure()
plt.xlabel("L2 Regularization Constant")
plt.ylabel("Error Rate %")
plt.title("L2 Regularization on Test Data")
plt.xscale('log')
X = [.0001, .001, .01, 1, 10, 100]
Y = [19.875, 20.625, 28.75, 29.5, 29.5, 29.5]
plt.scatter(X, Y)

# PLOT OF TRAIN ERROR LAMBDA
plt.figure()
plt.xlabel("L2 Regularization Constant")
plt.xscale('log')
plt.ylabel("Error Rate %")
plt.title("L2 Regularization on Training Data")
X = [.0001, .001, .01, .1, 1, 100]
Y = [.829, 1.60, 1.60, 1.60, 1.58, 1.52]
plt.scatter(X, Y)

plt.figure()
plt.xlabel("L2 Regularization Constant")
plt.xscale('log')
plt.ylabel("Average Parameter Value")
plt.title("Average parameter value with increasing lambda")
X = [.001, 1, 10]
Y = [138637, 122784616970 , 12276682592000]
plt.plot(X, Y)
plt.scatter(X, Y)

"""

plt.show()
