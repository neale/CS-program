import numpy as np
from Layers import Linear, ReLU, Sigmoid
from Loss   import CrossEntropy

class FullyConnected(object):

    def __init__(self, input_dims, hidden_units):
        
        self.grad            = None
        self.outputs         = None
        self.dInput          = input_dims
        self.nHidden         = hidden_units
        self.nOutput         = 1
        self.lossF           = 0.
        self.output          = 0.

    def initLayers(self):
      
        self.hiddenLayer  = Linear(.25, .1, self.dInput, self.nHidden)
        self.reluLayer    = ReLU()
        self.outputLayer  = Linear(.25, .1, self.nHidden, self.nOutput)
        self.sigmoidLayer = Sigmoid()
        self.lossLayer    = CrossEntropy()

    def forward(self, x):
              
        x = self.hiddenLayer.forward(x)
        x = self.reluLayer.forward(x)
        x = self.outputLayer.forward(x)
        x = self.sigmoidLayer.forward(x)
        return x

    def loss(self, x, y):

        self.loss = lossLayer.loss(x, y)

    def backward(self, x, y):
        
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
       
    def update(self):
        self.output.update()
        self.hidden.update()

    def classify(self, prob):
        if prob > .5: return 1
        else        : return 0
        
 
