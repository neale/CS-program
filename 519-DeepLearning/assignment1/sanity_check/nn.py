print(__doc__)

import matplotlib.pyplot as plt
import numpy as np
import cPickle

from sklearn.neural_network import MLPClassifier
# rescale the data, use the traditional train/test split

# mlp = MLPClassifier(hidden_layer_sizes=(100, 100), max_iter=400, alpha=1e-4,
#                     algorithm='sgd', verbose=10, tol=1e-4, random_state=1)

    data = cPickle.load(open('cifar_2class_py2.p', 'rb'))
    train_x = data['train_data']
    train_y = data['train_labels']
    test_x  = data['test_data']
    test_y  = data['test_labels']
    
 
mlp = MLPClassifier(hidden_layer_sizes=(10,), batch_size=100,
                    max_iter=3, algorithm='sgd', verbose=True, learning_rate_init=.01)

mlp.fit(train_x, train_y)
print("Training set score: %f" % mlp.score(train_x, train_y))
print("Test set score: %f" % mlp.score(test_x, test_y))
"""
fig, axes = plt.subplots(4, 4)
# use global min / max to ensure all weights are shown on the same scale
vmin, vmax = mlp.coefs_[0].min(), mlp.coefs_[0].max()
for coef, ax in zip(mlp.coefs_[0].T, axes.ravel()):
    ax.matshow(coef.reshape(28, 28), cmap=plt.cm.gray, vmin=.5 * vmin,
               vmax=.5 * vmax)
    ax.set_xticks(())
    ax.set_yticks(())

plt.show()
"""
