from __future__ import print_function
import numpy as np

""" This will be the interior of the sigmoid cross entropy function, 
this is what also will be conputed at each layer. We can vectorize this 
simply by using numpy matrix ops. The forward operation is simply a dot(W, x)
and the backward pass will accumulate gradients and update the weights"""

class Linear(object):

    def __init__(self, mean, std, w, h):
        self.i  = h
        self.o  = w
        self.W  = np.random.normal(0, .1, (w, h))
        self.b  = np.zeros(w)
        self.Dw = 0
        self.Db = 0
        self.l2 = .0001
    
    def set_params(self, W):
        self.W = W

    def forward(self, x):
        return np.dot(self.W, x) + self.b

    def backward(self, grad):
        
        return np.dot(grad, self.W)

    def update(self, x, grad, lr, m, solver="MOMENTUM"):
        # here x is the whole minibatch, and grad is the whole gradient
        if solver is "MOMENTUM":
            deltaW = []
            deltaB = []
            #print (x.shape, grad.shape)
            for i in xrange(len(x)):
                #print ("before ","in:",x[i].shape,"out :",grad[i].shape)
                g = np.tile(grad[i][...,None],(1, self.i))
                k = np.tile(x[i], (self.o, 1))

                deltaW.append(g * k)
                deltaB.append(np.dot(grad[i], np.identity(self.o)))
            deltaW = np.array(deltaW); deltaB = np.array(deltaB)
            #print ("g: ",g.shape, "k: ",k.shape)
            #print (deltaW.shape )
            if deltaB.ndim > 1:
                deltaB = deltaB.flatten()
            mean    = np.mean(deltaW, axis=0) 
            weight_decay = self.l2 * np.linalg.norm(self.W)
            update  = (m * self.Dw) - (lr * mean)# * weight_decay)
            scale = np.linalg.norm(self.W.ravel())
            uscale = np.linalg.norm(update.ravel())
            self.W += update[0]
            self.Dw = update[0]
            mean    = np.mean(deltaB, axis=0) 
            weight_decay = self.l2 * np.linalg.norm(self.b)
            update  = (m * self.Db) - (lr * mean)# * weight_decay)
            self.b += update
            self.Db = update


""" We just want to take the layer wise maximum of the inputs 
for the forward pass, and we want to truncate only the gradients 
in the backward pass"""

class ReLU(object):

    def forward(self, x):
        return np.maximum(x, 0)

    def backward(self, x, grad):
        
        output = np.diag(1 * (x > 0))
        return np.dot(output, grad)
      

# This is a class for a sigmoid layer followed by a cross entropy layer, the reason 
# this is put into a single layer is because it has a simple gradient form
class Sigmoid(object):

    def __init__(self):
        #self.sig = lambda x: np.exp(-np.logaddexp(0, -x))
        self.sig = lambda x: 1./(1.+np.exp(-x))

    def forward(self, x):
        return self.sig(x)

    def backward(self, x, loss):
        return np.dot(loss, np.diag(self.sig(x) * (1. - self.sig(x))))
       
