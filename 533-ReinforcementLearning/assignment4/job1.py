import numpy as np
import matplotlib.pyplot as plt
from bandit_test import test
from celery import Celery

app = Celery('plot', broker='pyamqp://guest:guest@localhost:5672//')

def plot(res, lin, label):
    x = np.arange(len(res))
    plt.xlabel("Number of arm pulls")
    plt.ylabel(label)
    plt.plot(x, res)
    plt.show()

@app.task
def test_bandit1():
    cum, sim, y = test("uniform", 'A')
    plot(cum, y, "Cumulative Regret")
    plot(sim, y, "Simple Regret")

@app.task
def test_bandit2():
    cum, sim, y = test("uniform", 'B')
    plot(cum, y, "Cumulative Regret")
    plot(sim, y, "Simple Regret")

@app.task
def test_bandit3():
    cum, sim, y = test("ucb", 'A')
    plot(cum, y, "Cumulative Regret")
    plot(sim, y, "Simple Regret")

@app.task
def test_bandit4():
    cum, sim, y = test("ucb", 'B')
    plot(cum, y, "Cumulative Regret")
    plot(sim, y, "Simple Regret")

@app.task
def test_bandit5():
    cum, sim, y = test("greedy", 'A')
    plot(cum, y, "Cumulative Regret")
    plot(sim, y, "Simple Regret")

@app.task
def test_bandit6():
    cum, sim, y = test("greedy", 'B')
    plot(cum, y, "Cumulative Regret")
    plot(sim, y, "Simple Regret")

if __name__ == '__main__':

    test_bandit3()
