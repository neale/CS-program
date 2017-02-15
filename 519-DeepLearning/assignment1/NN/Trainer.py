import numpy as np

class Trainer(object):
    
    def __init__(self, X, Y, Xv, Yv, net, epochs=10, batch_size=100, lr=.001, m=.9):
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
        
        for E in xrange(self.epochs):
            
            print ("Epoch {}".format(epoch))
            #shuffle arrays of data
            np.random.shuffle(np.array(train_x))
            np.random.shuffle(np.array(train_y))
            for batch in xrange(self.nbatches):
                """ this chunk of batching works fine """
                loss = 0.
                out  = np.zeros(self.batch_size)
                x, y = self.get_minibatch()
                for i in range(self.batch_size):
                    np.append(out, self.network.forward(x[i]))
                self.network.loss_batch(out, y)

                    
                loss += self.network.lossF
                
                print('[Epoch {}, mb {}], lr: {}, Avg.Loss = {}'.format(
                  E + 1,
                  batch + 1,
                  self.lr,
                  total_loss/b+1,
                  ))
                self.network.backward(x, y)
                self.network.update()


    def validate(self):
        sum = 0
        for i in range(len(self.Xval)):
            prob     = self.network.forward(self.Xval[i])
            print ("prob: {}".format(prob))
            pred     = self.network.classify(prob)
            print ("pred: {}, target: {}".format(pred, self.Yval[i]))
            if pred == self.Yval[i]:
                sum += 1
        self.val_acc = sum/(len(self.Xval))
        print ("Validation Accuracy: {}%".format(self.val_acc/100.))

