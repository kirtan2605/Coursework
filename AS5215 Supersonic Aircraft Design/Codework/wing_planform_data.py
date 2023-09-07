import numpy as np
import math
import matplotlib.pyplot as plt

a = 17.1         # affects span
b = 18.1         # affects root chord

y_lim = 0.15
x_lim = ((-1*math.log(y_lim/a))**0.5)*b

x = np.arange(0, x_lim + 1, 1)
y = a * np.exp(-(x/b)**2)
y = y[::-1]
print(x)
print(y)
area = np.trapz(y, x)
ar = a*a/area
plt.scatter(x, y, label='Ogive Wing Planform')

plt.xlabel('Chord length')
plt.xlim([0,40])
plt.ylabel('Half-Span')
plt.ylim([0,40])
plt.title('Ogive Wing Profile Curve')
plt.legend()
plt.show()
