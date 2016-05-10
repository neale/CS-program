import sys
import intertools, functools
import collections
import numpy

from sklearn.decomposition import PCA
from sklearn.svm import linearSVC
from sklearn.neighbors import KNeighborsClassifier as KNN
from sklearn.preprocessing import standard_scalar


datapath = '../data/train.cxv'
testpath = '../data/test.cxv'


