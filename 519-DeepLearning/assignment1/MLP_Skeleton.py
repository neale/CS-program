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
        self.D = 0

    def forward(self, x):
        return np.dot(self.W.T, x)

    def backward(self, grad_output, lr, momentum, l2):
        weight_decay = l2 * np.linalg.norm(self.W)
        D = (momentum * self.D) - (lr * grad_output * weight_decay)
        self.W = self.W + D
        self.D = D

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
            self.l = 0.0
            self.grad = 0.0

	def forward(self, x):
            return 1./(1.+np.exp(-x))
  
        def loss(self, outputs, targets):
            l = -( targets * np.log(outputs) + (1 - targets) * np.log(1 - outputs))
            return l

	def backward(self, outputs, targets):
            self.grad = self.forward(outputs) * (1. - self.forward(outputs))
            self.l = -(targets - outputs)
            #self.l = self.loss(outputs, targets)
            return self.l, self.l#self.grad * self.l, self.l
         
# This is a class for the Multilayer perceptron
class MLP(object):

    def __init__(self, input_dims, hidden_units, batch_size):
        
        self.batch           = batch_size
        self.initialWI       = np.random.normal(.25, .1, (input_dims, hidden_units)) 
        self.initialWH       = np.random.normal(.25, .1, (hidden_units, 1))
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
        self.evalW_old       = np.zeros((hidden_units, 1))

    # one train is a forward and backward method
    def train(self, x, y, lr, momentum, l2):
       
        self.grad    = np.array([])
        self.error   = np.array([])
        self.loss.grad = 0
        self.loss.l = 0
        self.outputs = 0
        self.InputTransform.D  = 0
        self.HiddenTransform.D = 0
        print (self.HiddenTransform.W)
        #print (self.HiddenTransform.W)
        #accumulate gradient in minibatch
        for i in range(self.batch):
            inI = map(float, np.array(x[i]))
            targets = map(float, np.array(y[i]))
            outH = np.array([])
            outO = np.array([])
            # normalize x
            inI -= np.mean(inI, axis=0, dtype=np.float64)
            inI /= np.std(inI, axis=0, dtype=np.float64)
            # forward each node in the layer
            outH = self.InputTransform.forward(inI)
            relu1 = self.relu.forward(outH)
            # forward though the output and take loss
            outO = self.HiddenTransform.forward(relu1)
            self.outputs = self.loss.forward(outO)
            l, g = self.loss.backward(self.outputs[0], targets[0])
            self.grad  = np.append(self.grad,  g)
            self.error = np.append(self.error, l)

        self.error = np.mean(self.error)
        self.grad  = np.mean(self.grad)
        print ("GRAD : {}".format(self.grad))
        # now the backward
        # backward though the output
        self.HiddenTransform.backward(self.grad, lr, momentum, l2)
        # backward through the relu
        self.grad *= relu1
        self.grad = self.relu.backward(self.grad)
        # backward through the nodes
        self.InputTransform.backward(self.grad, lr, momentum, l2)
        
        return self.loss.l
       
    # one eval is one forward
    def evaluate(self, x, y):
        
        x = map(float, x)
        y = map(float, y)
        x -= np.mean(x, axis=0, dtype=np.float64)
        x /= np.std(x, axis=0, dtype=np.float64)

        x = self.InputTransform.forward(x)
        x = self.relu.forward(x)
        x = self.HiddenTransform.forward(x)
        output = self.loss.forward(x)
        if output > .5: output = 1
        else          : output = 0
        
        if output == y[0]: return 1, y[0]
        else             : return 0, y[0]
        
# ADD other operations and data entries in MLP if needed

if __name__ == '__main__':
    
    data = cPickle.load(open('cifar_2class_py2.p', 'rb'))

    train_x = data['train_data']
    train_y = data['train_labels']
    test_x = data['test_data']
    test_y = data['test_labels']
    
    l2           = 0.01
    lr           = 0.001
    momentum     = 0.9
    batch_size   = 100
    num_epochs   = 10
    hidden_units = 10
    num_batches  = 100
    train_loss   = 0.0
    total_loss   = 0.0

    num_examples, input_dims = train_x.shape
    mlp = MLP(input_dims, hidden_units, batch_size)
    compW     = np.array([0])
    compW_old = np.array([0])
    for epoch in xrange(num_epochs):
        print ("Epoch {}".format(epoch))
        lr -= .0001
        np.random.shuffle(np.array(train_x))
        np.random.shuffle(np.array(train_y))
        for b in xrange(num_batches-1):
            
            total_loss = 0.0
            low = b * batch_size
            high = low + batch_size
            batch_x = train_x[ low : high ]
            batch_y = train_y[ low : high ]
            total_loss = mlp.train(batch_x, batch_y, lr, momentum, l2)
            train_loss += total_loss                        
            print('[Epoch {}, mb {}], lr: {}, Avg.Loss = {}'.format(
                    epoch + 1,
                    b + 1,
                    lr,
                    total_loss/b+1,
                    ))
            sys.stdout.flush()

        # now test the net
        sum = 0
        compW = mlp.InputTransform.W
        if np.array_equal(compW, compW_old):
            print ("W IS THE SAME")
        for idx in range(len(test_y)):
            pred, gt = mlp.evaluate(test_x[idx], test_y[idx])
            #print ("prediciton: {}\ttarget: {}".format(pred, gt))
            sum += pred
        acc = sum/(len(test_y))
        compW_old = compW

        print ("EPOCH {} ACCURACY : {}%".format(epoch, acc))
        
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

