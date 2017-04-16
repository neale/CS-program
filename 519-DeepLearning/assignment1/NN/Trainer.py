import numpy as np
import collections

class Trainer(object):
    
    def __init__(self, X, Y, Xv, Yv, net, epochs=2, batch_size=100, lr=1, m=.9):
        self.epochs     = epochs
        self.batch_size = batch_size
        self.lr         = lr
        self.m          = m
        self.X          = X
        self.Y          = Y
        self.Xval       = Xv
        self.Yval       = Yv
        self.network    = net 
        self.val_acc    = 0.
        self.batch      = 0
        self.loss       = 0.
        self.nbatches   = len(X)/batch_size
        np.set_printoptions(precision=3)


    def preprocess(self):

        self.X  = np.array(map(float, self.X))
        self.X -= np.mean(self.X, axis=0, dtype=np.float64)
        self.X /= np.std(self.X, axis=0, dtype=np.float64)
        self.Y  = np.array(map(float, self.Yval))
        self.Y -= np.mean(self.Y, axis=0, dtype=np.float64)
        self.Y /= np.std(self.Y, axis=0, dtype=np.float64)
        self.Xval  = np.array(map(float, self.Xval))
        self.Xval -= np.mean(self.Xval, axis=0, dtype=np.float64)
        self.Xval /= np.std(self.Xval, axis=0, dtype=np.float64)
        self.Yval  = np.array(map(float, self.Yval))
        self.Yval -= np.mean(self.Yval, axis=0, dtype=np.float64)
        self.Yval /= np.std(self.Yval, axis=0, dtype=np.float64)


    def get_minibatch(self):

        batch_low  = self.batch_size * self.batch
        batch_high = self.batch_size * (self.batch + 1)
        x_batch = self.X[batch_low:batch_high]
        y_batch = self.Y[batch_low:batch_high]
        return x_batch, y_batch

    def train(self):
        np.set_printoptions(precision=4) 
        ##DEBUG
        for E in xrange(self.epochs):
            
            loss = 0
            print ("Epoch {}".format(E))
            np.random.shuffle(self.X)
            np.random.shuffle(self.Y)
            #shuffle arrays of data
            #print ("BEGIN\n",self.network.hiddenLayer.W)
            #print (self.network.outputLayer.W)
            for batch in xrange(self.nbatches):
                self.batch = batch
                self.network.initAcivations()
                self.network.initGradients()
                out  = np.zeros(self.batch_size)
                x, y = self.get_minibatch()
                np.random.shuffle(x)
                np.random.shuffle(y)
                self.network.forward(x, y) 
                loss += self.network.lossF
                l = self.network.lossF
                self.network.collect_gradients(y)
                self.network.update_weights(x, self.lr)
                print('[Epoch {}, mb {}], lr {}, Avg.Loss= {}, l={}'.format(
                  E + 1,
                  batch + 1,
                  self.lr,
                  float(loss)/(batch+1),
                  l
                ))
            if E+1 in [2, 4, 6, 8]  :
                self.lr /= 10.
            v = self.validate()
        return v         

    def validate(self):
        sum = 0.
        count = np.count_nonzero(self.Yval)
        for i in range(len(self.Xval)):
            prob     = self.network.forward_single(self.Xval[i])
            pred     = self.network.classify(prob[0])
            if pred == self.Yval[i]:
                sum += 1.
        self.val_acc = sum/(len(self.Xval))
        print ("Validation Accuracy: {}%".format(self.val_acc*100.))
        return (100-(self.val_acc*100))

