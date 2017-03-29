import matplotlib.pyplot as plt
import numpy as np
## assignment 1
## 5, 10, 15, 20, 25, 30, 35, 40, 45, 50
n = np.array([0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 2, 2, 2, 0, 0, 0, 6, 5, 4 ,1 ,0, 0, 0, 0, 0, 1, 2, 5 ,7, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 3, 7, 0, 8, 2, 2, 21, 2, 2, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 2, 3, 0, 0, 0, 0, 0])
m = np.arange(0, len(n))

## assignment 2
## 5, 10, 15, 20, 30, 35, 40
a = np.array([0, 0, 0, 20, 20, 20, 40, 40, 40, 20, 80, 20, 40, 80, 100, 120, 100, 40, 160, 200, 100, 120, 200, 240, 160, 200, 40 , 340 ,140, 240, 220, 260, 280, 220, 280, 260, 400, 180, 340, 260, 360, 520, 120, 540, 260, 140, 320, 300, 240, 260, 320, 480, 200, 620, 380, 520, 260, 280, 240, 280, 360, 360, 480, 560, 400, 320, 280, 400, 120, 260, 460, 160, 300, 580, 260, 500, 540, 280, 540, 620,  620, 380, 520, 660, 480,400, 280, 360, 460, 480, 560, 600,  620, 380, 520, 460, 280, 540, 280, 360, 660, 480, 660, 820])
m = np.arange(0, len(n))

plt.subplot(2, 1, 1)

#plt.title("Fibonacci sequence implementations")
plt.title("Breakout A4C Training")

plt.plot(n, "-b")
plt.xlabel("Game")
#plt.ylabel("Iterative computation time (s))")
plt.ylabel("Score")

plt.subplot(2, 1, 2)
plt.title("SeaQuest A4C Training")
plt.plot(a, "-r")
plt.xlabel("Game")
plt.ylabel("Score")

plt.show()
        

