
from __future__ import print_function
import sys
import numpy as np
from Layers import Linear, ReLU, Sigmoid
from Loss   import CrossEntropy

class FullyConnected(object):

    def __init__(self, input_dims, hidden_units, batch_size):
        
        self.grad            = None
        self.outputs         = None
        self.dInput          = input_dims
        self.nHidden         = hidden_units
        self.nOutput         = 1
        self.lossF           = 0.
        self.lossG           = 0.
        self.lr              = .1
        self.momentum        = 0.9
        self.batch_size      = batch_size

    def initLayers(self):
      
        #self.hiddenLayer  = Linear(0, .1, self.dInput, self.nHidden)
        
        self.hiddenLayer  = Linear(0, .1, self.nHidden, self.dInput)
        self.reluLayer    = ReLU()
        self.outputLayer  = Linear(0, .1, self.nOutput, self.nHidden)
        self.sigmoidLayer = Sigmoid()
        self.lossLayer    = CrossEntropy()

    def initAcivations(self):

        self.startOfBatch       = True
        self.hiddenActivations  = np.zeros((self.batch_size, self.nOutput, self.nHidden))
        self.reluActivations    = np.zeros((self.batch_size, self.nOutput, self.nHidden))
        self.outputActivations  = np.zeros((self.batch_size, self.nOutput, self.nOutput))
        self.sigmoidActivations = np.zeros((self.batch_size, self.nOutput, self.nOutput))
        self.outputs            = np.zeros((self.batch_size, self.nOutput))
    
    def initGradients(self):
        self.startOfGrad = True
        self.lossG       = np.zeros((self.batch_size, 1, self.nOutput ))
        self.gradSigmoid = np.zeros((self.batch_size, 1, self.nOutput ))
        self.gradOutput  = np.zeros((self.batch_size, 1, self.nHidden ))
        self.gradRelu    = np.zeros((self.batch_size, 1, self.nHidden ))
        self.gradHidden  = np.zeros((self.batch_size, 1, self.dInput  ))

    def forward(self, x, y):
        
        for i in range(len(x)):
            self.input = np.array(x[i])
            self.hiddenActivations[i] = self.hiddenLayer.forward(self.input)
            self.reluActivations[i]   = self.reluLayer.forward(self.hiddenActivations[i])
            self.outputActivations[i] = self.outputLayer.forward(self.reluActivations[i].reshape(-1))
            self.sigmoidActivations[i] = self.sigmoidLayer.forward(self.outputActivations[i])
            self.outputs[i]            = self.sigmoidActivations[i]

            self.loss(self.outputs[i], y[i])

    def loss(self, x, y):

        self.lossF = np.mean(self.lossLayer.forward(x, y))

    def collect_gradients(self, y):
        
        for i in range(len(y)):
            self.lossG[i]       = self.lossLayer.backward(self.outputs[i], y[i])
            self.gradSigmoid[i] = self.sigmoidLayer.backward(self.outputActivations[i], self.lossG[i])
            self.gradOutput[i]  = self.outputLayer.backward(self.gradSigmoid[i].reshape(-1))
            self.gradRelu[i]    = self.reluLayer.backward(self.hiddenActivations[i], self.gradOutput[i])
            self.gradHidden[i]  = self.hiddenLayer.backward(self.gradRelu[i].reshape(-1))

    def update_weights(self, x, lr):
        self.outputLayer.update(self.reluActivations, self.gradSigmoid, lr, self.momentum)
        self.hiddenLayer.update(x, self.gradRelu, lr, self.momentum)

    def forward_single(self, x):
          input = np.array(x)
          hidden = self.hiddenLayer.forward(input)
          relu   = self.reluLayer.forward(hidden)
          output = self.outputLayer.forward(relu.reshape(-1))
          return self.sigmoidLayer.forward(output)


    def classify(self, prob):
        if abs(prob) > .5: return 1
        else             : return 0
        
 
