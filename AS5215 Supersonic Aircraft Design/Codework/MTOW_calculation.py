import numpy as np
import matplotlib.pyplot as plt

def takeoffwt(ratio=0.4389476417919297,W0=100000.0,Wpay=17550.0,a=1.22355,c=0.8959):
    # ratio should be between .45 to 0.55
    condition=False
    counter_limit = 5000
    counter = 0
    W=[W0]
    while(condition==False):
        We=a*(W0**c)
        Wf=1.06*W0*(1-ratio)
        W0st=Wpay/(1-(We/W0)-(Wf/W0))
        W.append(W0st)
        if abs((W0-W0st)/W0) < 1e-10:
            condition=True
        if counter > counter_limit:
            condition = True
            print("Counter Limit Exceeded")
        else:
            W0= W0st
            counter = counter + 1

    W=np.array(W)
    err = abs((W[1:]-W[:-1])/W[:-1])
    #Output
    print(" Payload: " ,Wpay," \n Empty weight:",We,"\n Fuel weight:", Wf,"\n Takeoff weight:",W0st)

    plt.plot(W/1000)
    plt.title('Maximum Take-off Weight (W_MTOW) Calculation', fontsize=12)
    plt.xlabel('iterations', fontsize=12)
    plt.ylabel('Maximum Take-off Weight (in tonne)', fontsize=12)
    plt.xticks(fontsize=12)
    plt.yticks(fontsize=12)
    plt.grid(True)
    plt.axis
    plt.show()

    return err # For error analysis

takeoffwt()