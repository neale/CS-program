import numpy as np
import matplotlib.pyplot as plt
import scipy.misc
def comp_graphs(function1, function2, x_range):
     n = np.array(x_range)
     m = eval(function1)
     p = eval(function2)
     plt.plot(n, m, '-r')
     plt.plot(n, p, '-y')
     plt.legend(['f(n)', 'g(n)'])
     plt.show()

#comp_graphs('10000*n', '.00001 * (n**2) - 100*n', range(1, 1000000000))
#comp_graphs('100*(n**2) - 1000*n', '.01*(n**2) + 10*n + 5', range(1, 100))
#comp_graphs('n**.25', 'n**.5', range(1, 100))
#comp_graphs('np.log(np.log(n))', 'np.log(n)', range(1, 100))
#comp_graphs('n', '(np.log(n))**2', range(1, 100))
#comp_graphs('np.log2(n)', '(np.log10(3*n))**2', range(1, 300))
#comp_graphs('np.log10(n)', 'np.log2(n)', range(1, 300))
#comp_graphs('np.power(2, n)', '10*(n**5)', range(1, 50))
#comp_graphs('np.exp(n)', 'np.power(2, n)', range(1, 50))
#comp_graphs('np.power(2, n)', 'np.power(2, n+1)', range(1, 55))
#comp_graphs('np.power(2, n)', '2**(np.power(2, n))', range(1, 5))
#comp_graphs('n**(2**n)', '2**n', range(1, 5))
comp_graphs('2**n', 'scipy.misc.factorial(n)', range(1, 50))
#comp_graphs('scipy.misc.factorial(n+1)', 'scipy.misc.factorial(n)', range(1, 100))
