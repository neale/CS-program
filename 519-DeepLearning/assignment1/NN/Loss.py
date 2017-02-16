import numpy as np

class CrossEntropy(object):

    def __init__(self):
        
        pass
 
    def forward(self, out, y):

        loss = lambda x, y: -(y * np.log(x +.0001) + (1.01 - y) * np.log(1.01 - x))

        if out.ndim > 1:
            return np.mean(loss(out, y))
        else:
            return loss(out, y)

        
    def backward(self, out, y):

        return np.subtract(out, y)

