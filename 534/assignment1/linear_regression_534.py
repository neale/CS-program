import numpy as np
#import matplotlib.pyplot as plt

verbose = True
plot = True
"""
We're going to use the L2 norm for regularization
Batch gradiant descent will be preformed until there is minimal improvement over multiple epochs.
We will also imlpement 5 fold cross validation, with a hyperparam grid search.
"""

"""
Note: empiracally N = 0.01 is the best learning rate
"""

def load_data():

    with open('./train_new.txt', 'rb') as f:
        train = f.readlines()
        train = [line.strip('\r\n') for line in train]
        for i, line in enumerate(train):
            train[i] = [float(n) for n in train[i].split(',')]
        train = np.array(train)

    # train[] now is a numpy array of n_samples x n_features

    # read in test data
    with open('./test_new.txt', 'rb') as f:
        test =  f.readlines()
        test =  [line.strip('\r\n') for line in test]
        for i, line in enumerate(test):
            test[i] = [float(n) for n in test[i].split(',')]
        test =  np.array(test)


    # images are represented in each row of pixels
    return train, test

def preprocess(X, bias=False):

    if bias: #training data
        X_b = np.ones((len(X), len(X[0])+1), dtype=np.float64)
        X_b[:, 1:] = X
        X = X_b[:,:-1] # X as all features
        Y = X_b[:,-1:] # Y as last column (targets)
    else: # testing data
        X = X[:,:-1]
        Y = X[:,-1:]

    X = (X / X.max(axis=0))
    #np.random.shuffle(X) # shuffle rows to ungroup classes
    return X, Y

def batched_grad_descent(X, Y, N, epochs):

    """ gradient descent using a naive gradient """
    # initialize weights to 0 (works fine for logistic regression)
    it = 0
    W = np.ones(X.shape[1])
    delta = np.zeros(W.shape)
    while it < epochs:
        Xiter = np.nditer(X, flags=['multi_index'], op_flags=['readwrite'])
        while not Xiter.finished:

            idx = Xiter.multi_index
            xi = X[idx[0]]
            dot = np.dot(W.T, xi)
            E = (dot - Y[idx[0]])
            delta = delta + (E * xi)
            Xiter.iternext()
        W = W - N*delta
        print np.linalg.norm(W)
        if verbose:
            print "epoch {}, L of {}, error:\n{}".format(it, N, delta)
        it = it+1
    return W
def grad_reg(X, Y, N, epochs, L):

    """ gradient descent using L2 regularization
    for all xi in X:
        calculate the sigmoid activation function for each xi
        subtract value from the given label
        add regularization term, constant * square of the norm
    """
    # initialize weights to 0 (works fine for logistic regression)
    it = 0
    epsilon = 1
    W = np.ones(X.shape[1])
    delta = np.zeros(W.shape)
    SSE = 100000000
    while np.abs(SSE) > epsilon:
        Xiter = np.nditer(X, flags=['multi_index'], op_flags=['readwrite'])
        while not Xiter.finished:

            idx = Xiter.multi_index
            xi = X[idx[0]]
            E = (np.dot(W.T, xi) - Y[idx[0]])
            SSE = np.linalg.norm(E)
            print "SSE : ",SSE
            delta = (E * xi) + (L*W)
            Xiter.iternext()
            W = W - 0.00001*delta
        if verbose:
            print "epoch {}, L OF {}, error:\n{}".format(it, N, delta)
        it = it+1
    return W

def predict(X, W):
    pred = np.dot(X, W)
    np.putmask(pred, pred >= 0.5, 1.0)
    np.putmask(pred, pred < 0.5, 0.0)
    return pred

def linear_regression():
    """ We're going to preform Kfold cross validation here
        - Learning Rate:
        - # of Epochs until covergence
    """
    X, test = load_data()
    X, Y = preprocess(X, bias=True)
    X_test, Y_test = preprocess(test, bias=True)
    K = 5
    epoch = 1
    N = .05
    Error = []
    foldsize = int(len(X)/K)
    E_train = np.zeros(foldsize, dtype=np.float64)
    E_val = np.zeros(foldsize, dtype=np.float64)
    print "using learning rate: {}\n\n".format(N)

    """ ONLY USE FOR CROSS VALIDATION """
    #learning rates = [.000005, .00005, .0005, .005, .05, .5]
    #regularizer = [.0001, .001, .01, .1, 1, 100]
    regularizer = [.001, 1, 10, 100, 1000]
    """
    for L in range(20):
        print "using regularization term: {}\n".format(L)
        for i in range(K):
            print "Fold {} of {}\n".format(i, K)
            val = range(foldsize * i, foldsize * (i+1))
            train = list(set(range(len(Y))) - set(val))
            Xt = X[train,:]
            Yt = Y[train]
            Xval = X[val, :]
            Yval = Y[val]

            #W = batched_grad_descent(Xt, Yt, N, epochs)
            W = grad_reg(Xt, Yt, N, 3, L)
            print sum(W)/(len(W))
            train_accuracy = predict(Xt, W)
            E_train[i] = float(sum(train_accuracy != Yt.flatten())) / len(Yt)
            val_accuracy = predict(Xval, W)
            E_val[i] = float(sum(val_accuracy != Yval.flatten())) / len(Yval)
        print "summary:"
        print "average train err =", np.mean(E_val) * 100, "%"
        print "average val err =", np.mean(E_val) * 100, "%"
    """
    err = 100
    for reg in regularizer:
        #W = batched_grad_descent(X, Y, N, epoch)
        W = grad_reg(X, Y, N, 15, reg)
        #E_test = test_thetas(X_test, Y_test, W)
        acc = predict(X, W)
        E_test = float(sum(acc != Y.flatten())) / len(Y)
        print "average test error = {}%".format(np.mean(E_test) * 100)
        Error.append(E_test)
        err = np.mean(E_test) * 100

    #plot_error(Error)

def test_thetas(X_test, Y_test, W):

    test_acc = predict(X_test, W)
    #for label in range(len(Y_test.flatten())):
        #print "testing: {} : {}".format(test_acc[label], Y_test[label])
    E_test = float(sum(test_acc != Y_test.flatten())) / len(Y_test)
    print "average test error = {}%".format(np.mean(E_test) * 100)
    return np.mean(E_test)

def plot_error(err):

    plt.figure()
    plt.scatter(err, range(20), color='m')
    plt.xlabel("Iteration of gradient descent")
    plt.ylabel("Error rate %")
    plt.title("Logistic Regression Error With L2 Regularization")
    plt.show()

if __name__ == '__main__':

    linear_regression()

