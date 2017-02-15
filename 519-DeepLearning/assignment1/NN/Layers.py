import numpy as np

""" This will be the interior of the sigmoid cross entropy function, 
this is what also will be conputed at each layer. We can vectorize this 
simply by using numpy matrix ops. The forward operation is simply a dot(W, x)
and the backward pass will accumulate gradients and update the weights"""

class Linear(object):

    def __init__(self, mean, std, w, h):
        self.W = np.random.normal(mean, std, (w, h))
        self.b = np.ones(h)
        self.D = 0
    
    def set_params(self, W):
        self.W = W

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
class Sigmoid(object):

    def __init__(self):
        pass

    def forward(self, x):
        return 1./(1.+np.exp(-x))

    def backward(self, x):
        return self.forward(x) * (1. - self.forward(x))
       
