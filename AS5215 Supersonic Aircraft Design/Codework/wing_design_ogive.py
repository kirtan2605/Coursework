import numpy as np
import math
import matplotlib.pyplot as plt

plt.figure()

wing_area = 548.5
e_minus = 0
e_plus = 0.2

# supersonic airplanes implement low Aspect Ratio and High Sweep
a_range = np.arange(15,18,0.1)
b_range = np.arange(10,30,0.1)


Area = []
AR = []
parameters = []

wing_num = 1



j_count = 0
for j in a_range:
    i_count = 0
    for i in b_range:
        a = j         # affects span
        b = i         # affects root chord

        y_lim = 0.005

        x_lim = ((-1*math.log(y_lim/a))**0.5)*b


        x = np.arange(0, x_lim + 0.01, 0.01)
        y = a * np.exp(-(x/b)**2)
        
        area = np.trapz(y, x)
        ar = a*a/area
        if area > (wing_area - e_minus)/2 and area < (wing_area + e_plus)/2 :
            Area.append(area)
            AR.append(ar)
            parameters.append((a,b))
            label_text = 'Wing {}'.format(wing_num)
            plt.plot(x, y, label=label_text)
            wing_num = wing_num + 1
        i_count = i_count + 1
        
    j_count = j_count + 1


## Mach Cone Rule
cruise_mach = 2.25
safety_factor_cruise_mach = 2.25*(1.05)       # 5% safety factor

mu = np.arcsin(1/cruise_mach)                           # mach_cone_half_angle
mu_design = np.arcsin(1/safety_factor_cruise_mach)      # design_mach_cone_half_angle

#print(math.degrees(mu))
#print(math.degrees(mu_design))

# Define the point and slope
x1, y1 = 40, 0
m = math.tan(- mu)
m_design = math.tan(- mu_design)


# Create x and y values for the line
x_mach_cone = range(0, 40)
y_mach_cone_design = [y1 + m_design * (xi - x1) for xi in x_mach_cone]
y_mach_cone = [y1 + m * (xi - x1) for xi in x_mach_cone]


plt.plot(x_mach_cone, y_mach_cone_design, '--', linewidth=0.9, label='Design Mach Cone')
plt.plot(x_mach_cone, y_mach_cone, '--', linewidth=0.8, label='Mach Cone')



plt.xlabel('Chord length')
plt.xlim([0,40])
plt.ylabel('Half-Span')
plt.ylim([0,40])
plt.title('Ogive Wing Profile Curve for e = 0.2')
plt.legend()
plt.show()

print(len(Area))
print(Area)
print(AR)
print(parameters)

np.savetxt("Area.csv", Area, delimiter=",")
np.savetxt("AR.csv", AR, delimiter=",")
