import numpy as np
import matplotlib.pyplot as plt

colors = np.random.rand(50)

""" END ERROR PER LEARNING RATE """
plt.figure()
plt.xlabel("Learning rates")
plt.ylabel("Error after 20 epochs")
plt.title("Learning rate comparison")
X = np.array([.000005, .00005, .0005, .005, .5])
Y = np.array([5.625, 5.25, 5.25, 5.25, 5.625])
plt.xscale('log')
plt.scatter(X, Y)

""" PLOT OF FINAL LEARNING RATE ERROR """
plt.figure()
plt.xlabel("Gradient Descent Iteration")
plt.ylabel("Error rate %")
plt.title("Logistic Regression Error on Test Data")
Y = np.array([50, 29.625, 49.375, 18.875, 27.375, 13, 4.75, 7.375, 9.625, 8.5, 6.625, 3.75, 3.5, 4, 4.5, 5.375, 5.75, 5.625, 5.25])
X = range(len(Y))
plt.scatter(X, Y)

""" PLOT OF FINAL LEARNING RATE ERROR """
plt.figure()
plt.xlabel("Gradient Descent Iteration")
plt.ylabel("Error rate %")
plt.title("Logistic Regression Error on Train Data")
Y = np.array([50, 28.7, 49.14, 16.42, 26.21, 12, 4.78, 6.0, 8.85, 8.85, 5.5, 4.0, 2.78, 2.42, 2.92, 3.85, 4.07, 4.14, 4.35])
X = range(len(Y))
plt.scatter(X, Y)

""" PLOT OF LAMBDA """
plt.figure()
plt.xlabel("L2 Regularization Constant")
plt.ylabel("Error Rate %")
plt.title("L2 Regularization on Test Data")
plt.xscale('log')
X = [.0001, .001, .01, 1, 10, 100]
Y = [19.875, 20.625, 28.75, 29.5, 29.5, 29.5]
plt.scatter(X, Y)

""" PLOT OF TRAIN ERROR LAMBDA """
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



plt.show()
