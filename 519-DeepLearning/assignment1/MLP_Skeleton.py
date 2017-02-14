"""
Neale Ratzlaff
"""

from __future__ import division
from __future__ import print_function

import sys

import cPickle
import numpy as np

""" This will be the interior of the sigmoid cross entropy function, 
this is what also will be conputed at each layer. We can vectorize this 
simply by using numpy matrix ops. The forward operation is simply a dot(W, x)
and the backward pass will accumulate gradients and update the weights"""

class LinearTransform(object):

    def __init__(self, W, hidden_units):
        self.W = W

    def forward(self, x):
        return np.dot(self.W.T, x)

    def backward(self, grad_output, lr, momentum, l2):
        weight_decay = l2 * np.linalg.norm(self.W)
        self.W[node] = self.W - lr * grad_output * weight_decay

""" We just want to take the layer wise maximum of the inputs 
for the forward pass, and we want to truncate only the gradients 
in the backward pass"""

class ReLU(object):

    def forward(self, x):
        return np.maximum(x, 0)

    def backward(self, grad_output):
        return np.maximum(grad_output, 0)
      

# This is a class for a sigmoid layer followed by a cross entropy layer, the reason 
# this is put into a single layer is because it has a simple gradient form
class SigmoidCrossEntropy(object):

        def __init__(self):
            self.l = None
            self.grad = None

	def forward(self, x):
            return 1./(1.+np.exp(-x))
  
        def loss(self, outputs, targets):
            l = -(targets * np.log(outputs) + (1 - targets) * np.log(1 - outputs))
            return l

	def backward(self, outputs, targets):
            self.grad = self.forward(outputs) * (1. - self.forward(outputs))
            self.l = self.loss(outputs, targets)
            return self.grad * self.l, self.l
         
# This is a class for the Multilayer perceptron
class MLP(object):

    def __init__(self, input_dims, hidden_units, batch_size):
        
        #self.initialWI       = np.random.randn(input_dims + hidden_units + 1, 4 * hidden_units) / np.sqrt(input_dims + hidden_units)
        #self.initialWH       = np.random.randn(input_dims + hidden_units + 1, 4 * hidden_units) / np.sqrt(input_dims + hidden_units)
        self.batch           = batch_size
        self.initialWI       = np.random.normal(.05, .01, (input_dims, hidden_units)) 
        self.initialWH       = np.random.normal(.05, .01, (hidden_units, 1))
        self.initialWI[0,:]  = 1 
        self.initialWH[0,:]  = 1 
        self.grad            = None
        self.outputs         = None
        self.dInput          = input_dims
        self.k               = hidden_units
        self.k_out           = 1
        self.error           = 0
        self.loss            = SigmoidCrossEntropy()
        self.InputTransform  = LinearTransform(self.initialWI, hidden_units)
        self.HiddenTransform = LinearTransform(self.initialWH, hidden_units)
        self.relu            = ReLU()

    # one train is a forward and backward method
    def train(self, x, y, lr, momentum, l2):
       
        self.grad    = 0
        self.error   = 0
        self.outputs = None
        #accumulate gradient in minibatch
        for i in range(self.batch):
            inI = map(float, np.array(x[i]))
            targets = map(float, np.array(y[i]))
            outH = None
            outO = None
            # normalize x
            inI -= np.mean(inI, axis=0, dtype=np.float64)
            inI /= np.std(inI, axis=0, dtype=np.float64)
            relu1 = np.zeros(self.k)
            # forward each node in the layer
            print (inI.shape, inI)
            print (self.InputTransform.W.shape)
            outH = self.InputTransform.forward(inI)
            print (outH.shape)
            
            relu1 = self.relu.forward(outH)
            print (relu1.shape, relu1)
            # forward though the output and take loss
            outO = self.HiddenTransform.forward(relu1)
            print (outO.shape, outO)
            self.outputs = self.loss.forward(outO)
            print (self.outputs.shape, self.outputs)
            l, g = self.loss.backward(self.outputs, targets)
            print ("EXAMPLE {}\nloss : {}\tgrad : {}\n\n".format(i, l, g))
            np.append(self.grad,  g)
            np.append(self.error, l)

        print (self.grad)
        sys.exit(0)
        self.error = np.mean(self.error)
        self.grad  = np.mean(self.grad, axis=1)
        # now the backward
        # backward though the output
        self.HiddenTransform.backward(self.grad, lr, momentum, l2)
        # backward through the relu
        self.grad = self.relu.backward(self.grad)
        # backward through the nodes
        self.InputTransform.backward(self.grad, lr, momentum, l2)
        
        return self.loss.loss
       
    # one eval is one forward
    def evaluate(self, x, y):
        x = self.transform.forward(x)
        x = self.relu.forward(x)
        output = self.loss.forward(x)
        return self.loss.loss(output, y)
        
# ADD other operations and data entries in MLP if needed

if __name__ == '__main__':
    
    data = cPickle.load(open('cifar_2class_py2.p', 'rb'))

    train_x = data['train_data']
    train_y = data['train_labels']
    test_x = data['test_data']
    test_y = data['test_labels']
    
    l2 = 0
    lr = .01
    momentum = .9
    batch_size = 100
    num_epochs = 10
    hidden_units = 10
    num_batches = 1000
    train_loss = 0
    num_examples, input_dims = train_x.shape
    mlp = MLP(input_dims, hidden_units, batch_size)

    for epoch in xrange(num_epochs):
        print ("Epoch {}".format(epoch))
        for b in xrange(0, num_batches-1):
            
            total_loss = 0.0
            low = b * batch_size
            high = low + batch_size
            batch_x = train_x[ low : high ]
            batch_y = train_y[ low : high ]
            total_loss = mlp.train( batch_x, batch_y, lr, momentum, l2 )
            train_loss += total_loss                        
            print('\r[Epoch {}, mb {}]    Avg.Loss = {}'.format(
                    epoch + 1,
                    b + 1,
                    total_loss,
                    ),
                    end='',
            )
            sys.stdout.flush()
        # now test the net
        for idx in xrange(len(train_y)):
            loss = mlp.evaluate(test_x[idx], test_y[idx])
            print ("prediciton: {}\ttarget: {}".format(loss, test_y[idx]))
        
        """
        print()
        print('    Train Loss: {:.3f}    Train Acc.: {:.2f}%'.format(
            train_loss,
            100. * train_accuracy,
        ))
        print('    Test Loss:  {:.3f}    Test Acc.:  {:.2f}%'.format(
            test_loss,
            100. * test_accuracy,
        ))
        """

