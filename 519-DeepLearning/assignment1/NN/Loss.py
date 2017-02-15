import numpy as np

class CrossEntropy(object):

    def __init__(self):
        
        pass
 
    def loss(self, out, y):

        return -(y * np.log(out) + (1.01 - y) * np.log(1.01 - out))

    def loss_batch(self, out, y):        
      
        return np.mean(self.loss(out, y)) 
    

