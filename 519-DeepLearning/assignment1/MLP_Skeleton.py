"""
INSERT YOUR NAME HERE
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

    def __init__(self, W):
        self.W = W

    def forward(self, x):
        return np.dot(W.T, x)

    def backward(self, grad_output, lr, momentum, l2):
        weight_decay = l2 * np.linalg.norm(self.W)
        self.W = self.W - lr * momentum * grad_output * weight_decay

""" We just want to take the layer wise maximum of the inputs 
for the forward pass, and we want to truncate only the gradients 
in the backward pass"""

class ReLU(object):

    def forward(self, x):
	# DEFINE forward function
        return np.maximum(x, 0, x)

    def backward(self, grad_output, lr=0.0, momentum=0.0, l2=0.0):
        # DEFINE backward function
        return np.maximum(grad_output, 0, grad_output)
      

# This is a class for a sigmoid layer followed by a cross entropy layer, the reason 
# this is put into a single layer is because it has a simple gradient form
class SigmoidCrossEntropy(object):

	def forward(self, x, transform):
	    # DEFINE forward function
            return 1./(1.+np.exp(transform.forward(x)))

	def backward(self, x, y):
	    # DEFINE backward function
            return self.forward(x)* (1. - self.forward(x))
           
# This is a class for the Multilayer perceptron
class MLP(object):

    def __init__(self, input_dims, hidden_units):
        # INSERT CODE for initializing the network
        
        self.initialWI       = np.random.randn(input_dims + hidden_units + 1, 4 * hidden_units) / np.sqrt(input_dims + hidden_units)
        self.initialWH       = np.random.randn(input_dims + hidden_units + 1, 4 * hidden_units) / np.sqrt(input_dims + hidden_units)
        self.initialWI[0,:]  = 1 #init biases to 1
        self.initialWH[0,:]  = 1 #init biases to 1
        self.grad            = None
        self.forward_result  = None
        self.dInput          = input_dims
        self.k               = hidden_units
        self.loss            = SigmoidCrossEntropy()
        self.InputTransform  = LinearTransform(self.initialWI)
        self.HiddenTransform = LinearTransform(self.initialWH)
        self.relu            = ReLU()

    # one train is a forward and backward method
    def train(self, x, y, lr, momentum, l2,):
	# one forward pass
        x   = self.InputTransform.forward(x)
        x   = self.relu.forward(x)
        x   = self.HiddenTransform.forward(x)
        self.forward_result = self.loss.forward(x, transform)

        # now the backward
        self.grad = self.loss.backward(x, y)
        self.grad = self.HiddenTransform(x, self.grad)
        self.grad = self.relu.backward(x, self.grad)
        self.grad = self.InputTransform(x, self.grad)
          
    # one eval is one forward
    def evaluate(self, x, y):
        self.transform.forward(x)
        self.relu.forward(x)
        self.loss.forward(x, transform)

# ADD other operations and data entries in MLP if needed

if __name__ == '__main__':
    
    data = cPickle.load(open('cifar_2class_py2.p', 'rb'))

    train_x = data['train_data']
    train_y = data['train_labels']
    test_x = data['test_data']
    test_y = data['test_labels']
    
    l2 = 0
    lr = .1
    momentum = .9
    num_epochs = 10
    hidden_units = 10
    num_batches = 1000
    num_examples, input_dims = train_x.shape
    args = [lr, momentum, l2, input_dims, hidden_units]
    mlp = MLP(input_dims, hidden_units, args)
    for epoch in xrange(num_epochs):
        for b in xrange(num_batches):

            total_loss = 0.0
            mlp.train(train_x, train_y, lr, momentum, l2)
            
            print('\r[Epoch {}, mb {}]    Avg.Loss = {:.3f}'.format(
                    epoch + 1,
                    b + 1,
                    total_loss,
                    ),
                    end='',
            )
            sys.stdout.flush()
            # INSERT YOUR CODE AFTER ALL MINI_BATCHES HERE
            # MAKE SURE TO COMPUTE train_loss, train_accuracy, test_loss, test_accuracy
        print()
        print('    Train Loss: {:.3f}    Train Acc.: {:.2f}%'.format(
            train_loss,
            100. * train_accuracy,
        ))
        print('    Test Loss:  {:.3f}    Test Acc.:  {:.2f}%'.format(
            test_loss,
            100. * test_accuracy,
        ))
