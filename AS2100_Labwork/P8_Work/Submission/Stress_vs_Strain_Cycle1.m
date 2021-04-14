%Global variables
d=0.01;     %Diameter of rod in meters
d1=0.1;     %Length of lever in meters
L=1;        %Length of Rod in meters
g=9.81;     %Value of g in m/s^2
load('P8_TorsionTest.mat');

%Experiment 1

%Takes values of load from m_exp1 variable of P8_TorsionTest.mat
loads = m_exp1;
theta =theta_0exp1(:,1);    %Taking data of Cycle 1

%to make y and x of same dimensions since theta was columnar
theta=theta';

J=pi*(d^4)/32;   %Polar Second Moment of Inertia
T=loads*(g*d1);    %Torque applied on the rod
y=(T*(d/2))/J;      %Shear Stress in Pa

x=(theta*(d/2))/L;     %Shear Strain 

coefficients=polyfit(x,y,1);  %finds coeff of best fit line for Data
xFit = linspace(min(x),max(x),1000);
yFit = polyval(coefficients,xFit);
G_in_Pa=coefficients(1);  
%slope of the best fit line gives best estimate of Shear Modulus

G_in_GPa(1)=G_in_Pa/1e9;

%%% PLOTTING GRAPH
plot(xFit,yFit,'r-','LineWidth',2)
xlabel('Shear Strain (in radians)');
ylabel('Shear Stress (in Pa)');
title({sprintf('Exp 1 Cycle 1  G:%g GPa',G_in_GPa(1))})
figure; %%to plot different plots in different windows

%Repeat this for the first cycle for all Experiments
