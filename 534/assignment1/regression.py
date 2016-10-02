import sys
import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mat

verbose = True

def plot_error(X, Y, W, I):
    """plots SSE against learning rate
       Params:
         X: Training matrix (n_samples x n_features)
         Y: Target data
         I: Identity matrix of size (X.T* X)

       Return: None
    """
    # create pyplot figure
    plt.figure()
    learning_rates = [.000001, .001, .01, .05, .1, .5, 1, 10, 100, 1000, 100000, 10000000]
    # create RGB tuples to colorize scatter plot
    colors = mat.cm.rainbow(np.linspace(0, 1, len(learning_rates)))
    E_min = np.inf
    Error = []
    for learning_rate in learning_rates:
        # recalculate weights and sse using learning rate 
        W = np.dot(np.linalg.inv(np.dot(X.T, X) + (I * learning_rate)), np.dot(X.T, Y))
        print "Learned Weights:\n", W
        # get SSE
        E = (np.dot((Y - np.dot(X, W)).T, (Y - np.dot(X, W))))
        Error.append(E)
        if E_min > E:
            E_min = E
            L = learning_rate
        plt.scatter(np.arange(len(E)), E, color=colors)
        plt.xlabel("Learning Rate")
        plt.ylabel("SSE")
        plt.title("SSE by Learning Rate")

        print "\nSum of error reported for learning rate {}:\n{}".format(learning_rate, E)


    plt.scatter(learning_rates, Error, colors)
    # plot on a log scale
    plt.xscale('log')
    plt.show()
    # display the minimum error and best value for learning_rate
    print "\nThe minimum error through SSE was {} from a learning rate of {}".format(E_min, L)
    return

def main():

    # load training values into a numpy array
    # stip newline characters
    # add comma delimiters between values

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

    # create bias matrix and mask it with the training data, leaving a single column
    train_bias = np.ones((len(train), len(train[0])+1), dtype=np.float64)
    train_bias[:, 1:] = train


    X = train_bias[:,:-1] # X as all features
    Y = train_bias[:,-1:] # Y as last column (targets)
    I = np.eye(np.dot(X.T,X).shape[0], dtype=np.float64) # Identity matrix the size of (X.T*X)
    if verbose:
        print "X with bias column added:\n", X

    # compute optimial weight vector: W = (XT * X)^-1 * (XT * Y)
    try :
        W = np.dot(np.dot(np.linalg.inv(np.dot(X.T, X)), X.T), Y)
    except :
        W = np.dot(np.dot(np.linalg.pinv(np.dot(X.T, X)), X.T), Y)
    if verbose:
        print "\n--learned weights: \n\n", W

    # apply weights to data and apply SSE
    E = np.dot((Y - np.dot(X, W)).T, (Y - np.dot(X, W)))
    if verbose:
        print "\n--SSE:\n\n", E

    # SSE without bias column 
    X_b = train
    W_b = np.dot(np.dot(np.linalg.inv(np.dot(X_b.T, X_b)), X_b.T), Y)
    E_b = np.dot((Y - np.dot(X_b, W_b)).T, (Y - np.dot(X_b, W_b)))
    if verbose:
        print "\nWeights without the biasing term:\n", W_b
        print "\nError without biasing term:\n", E_b
        print "\n\nDifference between SSE with bias term and SSE without:\n", E - E_b

    # plot error calculations with a learning rate
    if verbose:
        plot_error(X, Y, W, I)

    return

if __name__ == '__main__':

    main()

