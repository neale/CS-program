
from __future__ import print_function
import sys
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
        self.lossG           = 0.
        self.lr              = .1
        self.momentum        = 0.9
        self.batch_size      = 100

    def initLayers(self):
      
        #self.hiddenLayer  = Linear(0, .1, self.dInput, self.nHidden)
        
        self.hiddenLayer  = Linear(0, .1, self.nHidden, self.dInput)
        self.reluLayer    = ReLU()
        self.outputLayer  = Linear(0, .1, self.nOutput, self.nHidden)
        self.sigmoidLayer = Sigmoid()
        self.lossLayer    = CrossEntropy()

    def initAcivations(self):

        self.startOfBatch       = True
        self.hiddenActivations  = np.zeros((100, self.nOutput, self.nHidden))
        self.reluActivations    = np.zeros((100, self.nOutput, self.nHidden))
        self.outputActivations  = np.zeros((100, self.nOutput, self.nOutput))
        self.sigmoidActivations = np.zeros((100, self.nOutput, self.nOutput))
        self.outputs            = np.zeros((100, self.nOutput))
    
    def initGradients(self):
        self.startOfGrad = True
        self.lossG       = np.zeros((100, self.nOutput, ))
        self.gradSigmoid = np.zeros((100, self.nOutput, ))
        self.gradOutput  = np.zeros((100, self.nHidden, ))
        self.gradRelu    = np.zeros((100, self.nHidden, ))
        self.gradHidden  = np.zeros((100, self.dInput, ))

    def forward(self, x, y):
        
        for i in range(len(x)):
            self.input = np.array(x[i])
            self.hiddenActivations[i] = self.hiddenLayer.forward(self.input)
            self.reluActivations[i]   = self.reluLayer.forward(self.hiddenActivations[i])
            self.outputActivations[i] = self.outputLayer.forward(self.reluActivations[i].reshape(-1))
            self.sigmoidActivations[i] = self.sigmoidLayer.forward(self.outputActivations[i])
            self.outputs[i]            = self.sigmoidActivations[i]
        print (i)

        self.lossF = self.loss(self.sigmoidActivations[i], y[i])

    def loss(self, x, y):

        self.lossF = self.lossLayer.forward(x, y)

    def collect_gradients(self, y):
        
        print (self.hiddenActivations.shape[98])
        print (self.reluActivations.shape[99])
        print (self.outputActivations[99])
        print (self.sigmoidActivations[99])
        for i in range(len(y)):
            self.lossG[i]       = self.lossLayer.backward(self.outputs[i], y[i])
            self.gradSigmoid[i] = self.sigmoidLayer.backward(self.outputActivations[i], self.lossG[i])
            self.gradOutput[i]  = self.outputLayer.backward(self.gradSigmoid[i].reshape(-1))
            self.gradRelu[i]    = self.reluLayer.backward(self.hiddenActivations[i].reshape(-1), self.gradOutput[i])
            self.gradHidden[i]  = self.hiddenLayer.backward(self.gradRelu[i].reshape(-1))

    def update_weights(self, x):
       
        self.outputLayer.update(self.reluActivations.reshape(-1), self.gradSigmoid.reshape(-1), self.lr, self.momentum)
        self.hiddenLayer.update(x.reshape(-1), self.gradRelu.reshape(-1), self.lr, self.momentum)

    def classify(self, prob):
        if prob > .5: return 1
        else        : return 0
        
 
