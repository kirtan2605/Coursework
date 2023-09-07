from math import *
import numpy as np
import matplotlib.pyplot as plt

def TFW_calculation():
    n = 2                                           # number of engines

    climb_rate = 3500                               # in feet/min
    climb_rate = climb_rate * 0.3048 * (1/60)       # in meter/second

    g = 9.8                                         # in m/s^2

    sea_level_TSFC = 9.32                           # in g/(kN.s)
    cruise_TSFC = 40                                # in g/(kN.s)

    sea_level_TSFC = sea_level_TSFC * g * 1e-6 * n        # in 1/s
    cruise_TSFC = cruise_TSFC * g * 1e-6 * n              # in 1/s
    # taking TSFC as 85% of climb TSFC
    climb_TSFC = sea_level_TSFC/(0.85)
    climb_sup_TSFC = cruise_TSFC/(0.85)
    print(climb_TSFC)


    # Altitude Parameters
    take_off_altitude = 0                       # in feet/meters
    subsonic_cruise_altitude = 40000            # in feet
    supersonic_cruise_altitude = 60000          # in feet
    subsonic_loiter_altitude = 3500             # in feet
    subsonic_cruise_altitude = subsonic_cruise_altitude * 0.3048        # in meters
    supersonic_cruise_altitude = supersonic_cruise_altitude * 0.3048    # in meters
    subsonic_loiter_altitude = subsonic_loiter_altitude * 0.3048        # in meters

    # L/D Characteristics
    L_by_D_takeoff = 4.5
    L_by_D_climb = 6
    L_by_D_subsonic = 12
    L_by_D_supersonic = 7.5
    L_by_D_loiter = L_by_D_subsonic/0.866


    supersonic_cruise_speed = 2.25                  # Mach speed
    supersonic_cruise_speed = supersonic_cruise_speed * 295.5     # speed in m/s at 60,000 ft


    endurance = 25                      # endurance in minutes
    endurance = endurance * 60          # endurance in seconds
    loiter_TSFC = sea_level_TSFC                  # in g/(kN.s)

    loiter_TSFC = loiter_TSFC * g * 1e-6 * n              # in 1/s near SL



    #__________Phase_P1__________#
    dW_P1 = 0.970



    #__________Phase_P2__________#

    dh1 = subsonic_cruise_altitude - take_off_altitude
    dh2 = supersonic_cruise_altitude - subsonic_cruise_altitude

    M_i = 0.1
    M_f = 2.25

    dW_P2_1 = exp(-1*(dh1 * climb_TSFC)/(climb_rate*L_by_D_climb))
    dW_P2_2 = (0.991 - 0.07*M_f - 0.01*M_f*M_f)/(0.991 - 0.07*M_i - 0.01*M_i*M_i)
    dW_P2_3 = exp(-1*(dh2 * climb_sup_TSFC)/(climb_rate*L_by_D_climb))

    # should consider fuel fraction of acceleration ??
    dW_P2 = dW_P2_1 * 1 * dW_P2_3

    print("dW_P2_1 : ", dW_P2_1)
    print("dW_P2_2 : ", dW_P2_2)
    print("dW_P2_3 : ", dW_P2_3)
    print("dW_P2 : ", dW_P2)


    #__________Phase_P3__________#

    Range = 4700                        # cruise range in km
    Range = Range * 1000                # cruise range in meters

    dW_P3 = exp(-1*(Range * cruise_TSFC)/(supersonic_cruise_speed * L_by_D_supersonic))

    print("\ndW_P3 : ", dW_P3)

    #__________Phase_P4__________#
    dW_P4 = 1


    #__________Phase_P5__________#

    dW_P5 = exp(-1*(endurance * loiter_TSFC)/(L_by_D_loiter))

    print("\ndW_P5 : ", dW_P5)


    #__________Phase_P6__________#
    dW_P6 = 1


    #__________Phase_P7__________#

    dh3 = subsonic_loiter_altitude - take_off_altitude

    dW_P7 = exp(-1*(dh3 * climb_TSFC)/(climb_rate*L_by_D_climb))

    print("\ndW_P7 : ", dW_P7)


    #__________Phase_P8__________#
    dW_P8 = 1


    #__________Phase_P8__________#
    dW_P9 = dW_P5


    #__________Phase_P10__________#
    dW_P10 = 1



    #__________Phase_P11__________#
    dW_P11 = 0.995


    # calculating dW for MTW : Maximum Taxi Weight (including P1)
    # dW_bfw = dW_P1 * dW_P2 * dW_P3 * dW_P4 * dW_P5 * dW_P6 * dW_P7 * dW_P8 * dW_P9 * dW_P10 * dW_P11
    # print("\ndW_block : ", dW_bfw)

    # calculating dW for MTOW : Maximum Take-off Weight (ignoring P1)
    dW_end_by_dW_MTOW = dW_P2 * dW_P3 * dW_P4 * dW_P5 * dW_P6 * dW_P7 * dW_P8 * dW_P9 * dW_P10 * dW_P11
    print("\ndW_end/dW_MTOW : ", dW_end_by_dW_MTOW)

    dW_TFW_by_dW_MTOW =1.06*(1 - dW_end_by_dW_MTOW)
    print("\nW_TFW/W_MOTW : ", dW_TFW_by_dW_MTOW)



TFW_calculation()