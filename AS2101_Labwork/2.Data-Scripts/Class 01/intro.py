# this is a sample Python script to
# create a sine-curve

import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0,np.pi,21)
y1 = np.sin(x)
y2 = np.cos(x)

# plot this function using matplotlib
plt.plot(x,y1,'o-',label='Sine')
plt.plot(x,y2,'s-',label='Cosine')
plt.xlabel('X',fontsize=14)
plt.ylabel('Y',fontsize=14)
plt.xticks(fontsize=14)
plt.yticks(fontsize=14)
plt.tight_layout()
# plt.title('Trignometric functions')
plt.grid(linestyle='--')
plt.legend()

plt.savefig('trig_func.png')

# this command is required to view the plot
# plt.show()
