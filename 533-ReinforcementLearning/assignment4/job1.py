import numpy as np
import matplotlib.pyplot as plt
from bandit_test import test
#from celery import Celery

#app = Celery('plot', broker='pyamqp://guest:guest@localhost:5672//')

def plot(res, lin, title):
    x = np.arange(len(res[0]))
    plt.xlabel("Number of arm pulls")
    plt.ylabel(title)
    plt.plot(x, res[0], '-b', label='uniform')
    plt.plot(x, res[1], '-m', label='ucb')
    plt.plot(x, res[2], '-k', label='e-greedy') 
    plt.legend(loc="upper right")
    plt.show()

#@app.task
def test_banditA():
    cum1, sim1, y = test("uniform", 'A')
    cum2, sim2, y = test("ucb", 'A')
    cum3, sim3, y = test("greedy", 'A')
    plot([cum1, cum2, cum3], y, "Cumulative Regret")
    plot([sim1, sim2, sim3], y, "Simple Regret")

#@app.task
def test_banditB():
    cum1, sim1, y = test("uniform", 'B')
    cum2, sim2, y = test("ucb", 'B')
    cum3, sim3, y = test("greedy", 'B')
    plot([cum1, cum2, cum3], y, "Cumulative Regret")
    plot([sim1, sim2, sim3], y, "Simple Regret")

#@app.task
def test_bandit3():
    cum, sim, y = test("ucb", 'A')
    plot(cum, y, "Cumulative Regret")
    plot(sim, y, "Simple Regret")

#@app.task
def test_bandit4():
    cum, sim, y = test("ucb", 'B')
    plot(cum, y, "Cumulative Regret")
    plot(sim, y, "Simple Regret")

#@app.task
def test_bandit5():
    cum, sim, y = test("greedy", 'A')
    plot(cum, y, "Cumulative Regret")
    plot(sim, y, "Simple Regret")

#@app.task
def test_bandit6():
    cum, sim, y = test("greedy", 'B')
    plot(cum, y, "Cumulative Regret")
    plot(sim, y, "Simple Regret")

if __name__ == '__main__':

    test_banditA()
    test_banditB()
