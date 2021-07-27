import matplotlib.pyplot as plt
import numpy as np

def Frequency_Response_Amplitude(zeta):
	mod_G_iw_func = 1 / ((1 - r*r)**2 + (2*zeta*r)**2 )
	return mod_G_iw_func

def Frequency_Response_Phase(zeta):
	tan_phi_func = (2*zeta*r) / (1 - r*r)
	return tan_phi_func


r = np.linspace(0.5,1.5,51)

plt.plot(r,Frequency_Response_Amplitude(0.05),'o-',label='zeta = 0.05')

plt.plot(r,Frequency_Response_Amplitude(0.04),'x-',label='zeta = 0.04')

plt.plot(r,Frequency_Response_Amplitude(0.03),'x-',label='zeta = 0.03')

#plt.plot(r,tan_phi,'s-',label='tan(phi)')

plt.xlabel('r = w/w_n',fontsize = 14)
plt.ylabel('|G(iw)|',fontsize = 14)
plt.xticks(fontsize = 10)
plt.yticks(fontsize = 10)
plt.title('Amplitude Frequency_Response')
plt.grid(linestyle = '--')
plt.legend()
plt.savefig('Amplitude Frequency_Response1.png')

plt.show()