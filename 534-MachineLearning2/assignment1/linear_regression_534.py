import numpy as np
import matplotlib.pyplot as plt

a = [6.044, 6.03, 6.3, 6.13, 11.1, 16.54]
b = [.0001, .001, .01, .1, 1, 100]
c = [16, 10, 30, 208, 541, 2500]
verbose = False
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

def grad_reg(X, Y, N, L):

    """ gradient descent using L2 regularization
    for all xi in X:
        calculate the sigmoid activation function for each xi
        subtract value from the given label
        add regularization term, constant * square of the norm
    """
    # initialize weights to 0 (works fine for logistic regression)
    it = 0
    epsilon = 10
    W = np.zeros(X.shape[1])
    delta = np.zeros(W.shape)
    grad = 100000
    while np.abs(grad) > epsilon:
        Xiter = np.nditer(X, flags=['multi_index'], op_flags=['readwrite'])
        while not Xiter.finished:

            idx = Xiter.multi_index
            xi = X[idx[0]]
            SSE = (np.dot(W.T, xi) - Y[idx[0]])
            grad = np.linalg.norm(SSE * xi)
            if grad > 1000000:
                return np.zeros(X.shape[1])
            W = W - N * ( SSE + (L * np.linalg.norm(W)))

            Xiter.iternext()
        if verbose:
            print "epoch {}, L OF {}, error:\n{}".format(it, N, delta)
        print "SSE Gradient : " , grad, " , ", SSE
        it += 1
        print it
    print "converged in {} epochs".format(it)
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
    K = 10
    epoch = 1
    N = .00001
    #plot_error(c)
    Error, E = [], []
    foldsize = int(len(X)/K)
    E_train = np.zeros(foldsize, dtype=np.float64)
    E_val = np.zeros(foldsize, dtype=np.float64)
    print "using learning rate: {}\n\n".format(N)

    """ ONLY USE FOR CROSS VALIDATION """
    """rates = [.00005, .0005, .005, .05, .5, 5]
    #regularizer = [.0001, .001, .01, .1]
    #regularizer = [.001, 1, 10, 100, 1000]
    L = .0000000000001
    for N in rates:
        print "using regularization term: {}\n".format(N)
        for i in range(K):
            print "Fold {} of {}\n".format(i, K)
            val = range(foldsize * i, foldsize * (i+1))
            train = list(set(range(len(Y))) - set(val))
            Xt = X[train,:]
            print "Length of set : ", len(Xt)
            Yt = Y[train]
            Xval = X[val, :]
            Yval = Y[val]
            W = grad_reg(Xt, Yt, N, L)
            E.append(test_thetas(X_test, Y_test, W))
            
        Error.append(E)
        print "Average Error for L = {} : {}".format(L, np.mean(E))
        #print "average train err =", np.mean(E_val) * 100, "%"
        #print "average val err =", np.mean(E_val) * 100, "%"
    """
    print Error
    reg = .0000001 
    for N in [.0005, .005, .05, .5, 5]:
       W = grad_reg(X, Y, N, reg)
       E_test = test_thetas(X_test, Y_test, W)
       Error.append(E_test)

    plot_error(Error)

def test_thetas(X, Y, W):

    E = []
    for i, xi in enumerate(X):
        E.append(np.abs(np.dot(W.T, xi) - Y[i]))
    E_test = np.mean(E)
    print "average test error = {}".format(E_test)
    return E_test

def plot_error(err):

    avg_error = [np.mean(i) for i in err]
    plt.figure()
    plt.scatter(err, b, color='m')
    plt.xlabel("SSE")
    plt.ylabel("Learning Rate")
    plt.title("Linear Regression Error With L2 Regularization")
    plt.show()

if __name__ == '__main__':

    linear_regression()

