import matplotlib.pyplot as plt
import numpy as np
import math


def combined_constraint_diagram():
    one = np.ones(10000)
    x = np.linspace(10,8000,10000)
    fig2 = plt.figure(figsize=(8.0, 6.0))
    L_by_D_max = 14


    #_____Cruise_Consideration_____#
    rho = 1.225                     # Density at sea level
    rho_11 = 0.365                  # Density at 11 km
    rho_60 = 0.1164756              # Density at 60000 ft
    M = 2.25                        # Cruise Mach number
    v = M * 295.5                   # Cruise velocity
    q = 0.5*rho_60*v*v              # Dynamic pressure at 60000 ft

    gamma = 1.4                     # Specific heat ratio of air
    n_inlet = 1                     # Engine Inlet Efficiency

    # Density Correction Factor
    tau_rho = (rho_11/rho)**0.7 * (rho_60/rho_11)
    # Pressure Correction Factor
    tau_p = (1+(n_inlet * (gamma - 1)/2 * M*M))*(gamma/(gamma-1))


    W_20 = 0.9256 * 0.97            # W_cruise / W_MTW
    C_d0 = 0.0185                   # Profile Drag Coefficient
    K = 0.052                       # Drag due to Lift Factor

    # T/W for Supersonic Cruise Consideration
    TWcruise = (C_d0*q/(x*W_20) + (K/q)*x*W_20)*W_20/(tau_p * tau_rho)
    plt.plot(x,TWcruise,label = 'Cruise')


    #____One_Engine_Inoperative_Take_off_Distance_Considerations___#
    s_takeoff = 3500                # Design Take-off Distance
    n_eng = 4                       # No. of engines
    g = 9.81                        # Acceleration due to gravity
    A = 1.687886925                 # Aspect ratio of the wing

    # T/W for OEI Take-off Length Consideration
    TWtakeoff = 1.1*np.sqrt(n_eng/(n_eng-1) * (x/(A*rho*g*s_takeoff)))
    plt.plot(x, TWtakeoff,label='OEI Takeoff')
    # 5% tolerance in Take-off Distance
    plt.plot(x, TWtakeoff/np.sqrt(1.05), '--', color = 'orange')


    #________Landing_Distance_Considerations________#
    C_lmax = 1.2                    # Maximum coefficient of lift
    W_110 = 0.42876182              # W_landing/W_MTW
    s_land = 2000                   # Design Landing Distance

    # W/S for Landing Distance Considerations
    WSland = 0.8563*rho*C_lmax*s_land/W_110
    plt.axvline(WSland,0,1,color = 'green',label = 'Landing')
    # 5% tolerance in Landing Distance
    plt.axvline(WSland*1.05,0,1,color = 'green',linestyle = '--')


    #_____One_Engine_Inoperative_Climb_Rate_Considerations_____#
    L_by_D_climb = 5                # L/D during Climb
    gamma_SSCG = 0.024              # FAR-25 Regulations
    W_10 = 0.97                     # W1/W0
    TW_SSCG_OEI = n_eng/(n_eng -1)*((1/L_by_D_climb) + gamma_SSCG)*W_10 

    # T/W for Second-Stage Climb Gradient
    plt.plot(x,one*TW_SSCG_OEI,color = 'red',label = 'OEI SSCG')
    # +5% tolerance in T/W
    plt.plot(x,one*TW_SSCG_OEI*1.05,'--',color = 'red')

    W_50 = 0.428761682             # W5/W0
    gamma_MA = 0.021               # FAR-25 Regulatios
    TW_MA_OEI = n_eng/(n_eng -1)*((1/L_by_D_climb) + gamma_MA)*W_50
    # T/W for Missed Approach Climb Gradient
    plt.plot(x,one*TW_MA_OEI,color = 'black',label = 'OEI MA')


    #________Stall_Considerations_______#
    WS_stall = 4274.03
    plt.axvline(WS_stall,0,1,color = '#33FFBD',label = 'SL stall')
    plt.axvline(WS_stall*1.05,0,1,color = '#33FFBD',linestyle = '--')
    plt.axvline(WS_stall*0.95,0,1,color = '#33FFBD',linestyle = '--')

    #________Absolute_Ceiling_______#
    h_ac = 60000                    # absolute ceiling in feet
    sigma_ac = 0.2967*math.exp(1.7355 - (4.8075*h_ac)/100000) 
    TW_abs_ceil = 1/sigma_ac*L_by_D_max
    print(TW_abs_ceil)
    plt.plot(x,one*TW_abs_ceil,label = 'Absolute Ceiling')


    #________Design_Area________#
    x1 = np.linspace(10,WS_stall*1.05,10000)
    y2 = 1
    y1 =(C_d0*q/(x1*W_20) + (K/q)*x1*W_20)*W_20/(tau_p * tau_rho)
    y3 = TW_SSCG_OEI*1.05
    y4 = np.maximum(y1, y3)
    plt.fill_between(x1,y4,y2,facecolor='orange',alpha = 0.3,label = 'Design Area')



    #_______Design_Point_______#
    plt.plot(WS_stall*1.05,TW_SSCG_OEI*1.05,'x',color = 'purple',label = 'Design Point')
    plt.text(2500,0.3250,'({0:0.4f},{1:0.4f})'.format(WS_stall*1.05,TW_SSCG_OEI*1.05))
    plt.legend(loc=1)
    plt.title('Combined Constraint Diagram', fontsize=15)
    plt.xlabel('Wing Loading (W/S) in $N/m^2$', fontsize = 15)
    plt.ylabel('Thrust Loading (T/W)', fontsize=15)
    plt.xticks(fontsize=12)
    plt.yticks(fontsize=12)
    plt.ylim(0,0.75)
    plt.show()

combined_constraint_diagram()