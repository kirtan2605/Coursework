%Global variables
d=0.01;     %Diameter of rod in meters
d1=0.1;     %Length of lever in meters
L=1;        %Length of Rod in meters
g=9.81;     %Value of g in m/s^2
load('P8_TorsionTest.mat');





%hold on;    %if we want to plot them in the same window
%Group 1

%Takes values of load from m_exp1 variable of P8_TorsionTest.mat
loads = m_exp1;

%Takes values of theta from column i of theta_0exp1 variable of P8...mat 
theta =theta_0exp1(:,1);    %change cycle number here for data. Taking Cycle 1

%plot(loads,theta); %Plots original y_vs_x Data
theta=theta'; %to make y and x of same dimensions since theta was columnar

J=pi*(d^4)/32;   %Polar Second Moment of Inertia
T=loads*(g*d1);    %Torque applied on the rod
y=(T*(d/2))/J;      %Shear Stress in Pa

x=(theta*(d/2))/L;     %Shear Strain 

coefficients=polyfit(x,y,1);  %finds coeff of best fit line for Data
xFit = linspace(min(x),max(x),1000);
yFit = polyval(coefficients,xFit);
G_in_Pa=coefficients(1);  %slope of the best fit line gives Shear Modulus

%to see full value of slope, use command 'format long'

%str=sprintf('%f Pascals',G_in_Pa);
%str ='28875391321.054501 Pascals'

%str=sprintf('%g Pascals',G_in_Pa);
%str ='2.88754e+10 Pascals'

G_in_GPa(1)=G_in_Pa/1e9;
 

%disp(sprintf('Slop of best fit line theta(radian) vs mass(kg) : %g',slope));
%str=sprintf('%g GPa',G_in_GPa)
%str = '2.88754 GPa'


%%% PLOTTING GRAPH
hold on;
plot(xFit,yFit,'r-','LineWidth',2)
scatter(x,y);
xlabel('Shear Strain (in radians)');
ylabel('Shear Stress (in Pa)');
title({sprintf('Exp 1 Cycle 1  G:%g GPa',G_in_GPa(1))})
hold off;
figure; %%to plot different plots in different windows











%GROUP 2

%Takes values of load from m_exp1 variable of P8_TorsionTest.mat
loads = m_exp2;

%Takes values of theta from column i of theta_0exp1 variable of P8...mat 
theta =theta_0exp2(:,1);    %change cycle number here for data. Taking Cycle 1

%plot(loads,theta); %Plots original y_vs_x Data
theta=theta'; %to make y and x of same dimensions since theta was columnar

J=pi*(d^4)/32;   %Polar Second Moment of Inertia
T=loads*(g*d1);    %Torque applied on the rod
y=(T*(d/2))/J;      %Shear Stress in Pa

x=(theta*(d/2))/L;     %Shear Strain 

coefficients=polyfit(x,y,1);  %finds coeff of best fit line for Data
xFit = linspace(min(x),max(x),1000);
yFit = polyval(coefficients,xFit);
G_in_Pa=coefficients(1);  %slope of the best fit line gives Shear Modulus

%to see full value of slope, use command 'format long'

%str=sprintf('%f Pascals',G_in_Pa);
%str ='28875391321.054501 Pascals'

%str=sprintf('%g Pascals',G_in_Pa);
%str ='2.88754e+10 Pascals'

G_in_GPa(2)=G_in_Pa/1e9;
 

%disp(sprintf('Slop of best fit line theta(radian) vs mass(kg) : %g',slope));

%str=sprintf('%g GPa',G_in_GPa)
%str = '2.88754 GPa'


%%% PLOTTING GRAPH
hold on;
plot(xFit,yFit,'r-','LineWidth',2)
scatter(x,y);
xlabel('Shear Strain (in radians)');
ylabel('Shear Stress (in Pa)');
title({sprintf('Exp 2 Cycle 1  G:%g GPa',G_in_GPa(2))})
hold off;
figure; %to plot different plots in different windows















%GROUP 3

%Takes values of load from m_exp1 variable of P8_TorsionTest.mat
loads = m_exp3;

%Takes values of theta from column i of theta_0exp1 variable of P8...mat 
theta =theta_0exp3(:,1);    %change cycle number here for data. Taking cycle 1

%plot(loads,theta); %Plots original y_vs_x Data
theta=theta'; %to make y and x of same dimensions since theta was columnar

J=pi*(d^4)/32;   %Polar Second Moment of Inertia
T=loads*(g*d1);    %Torque applied on the rod
y=(T*(d/2))/J;      %Shear Stress in Pa

x=(theta*(d/2))/L;     %Shear Strain 

coefficients=polyfit(x,y,1);  %finds coeff of best fit line for Data
xFit = linspace(min(x),max(x),1000);
yFit = polyval(coefficients,xFit);
G_in_Pa=coefficients(1);  %slope of the best fit line gives Shear Modulus

%to see full value of slope, use command 'format long'

%str=sprintf('%f Pascals',G_in_Pa);
%str ='28875391321.054501 Pascals'

%str=sprintf('%g Pascals',G_in_Pa);
%str ='2.88754e+10 Pascals'

G_in_GPa(3)=G_in_Pa/1e9;
 

%disp(sprintf('Slop of best fit line theta(radian) vs mass(kg) : %g',slope));

%str=sprintf('%g GPa',G_in_GPa)
%str = '2.88754 GPa'

%%% PLOTTING GRAPH
hold on;
plot(xFit,yFit,'r-','LineWidth',2)
scatter(x,y);
xlabel('Shear Strain (in radians)');
ylabel('Shear Stress (in Pa)');
title({sprintf('Exp 3 Cycle 1  G:%g GPa',G_in_GPa(3))});
hold off;
figure; %to plot different plots in different windows























%GROUP 4

%Takes values of load from m_exp1 variable of P8_TorsionTest.mat
loads = m_exp4;

%Takes values of theta from column i of theta_0exp1 variable of P8...mat 
theta =theta_0exp4(:,1);    %change cycle number here for data. Taking Cycle 1

%plot(loads,theta); %Plots original y_vs_x Data
theta=theta'; %to make y and x of same dimensions since theta was columnar

J=pi*(d^4)/32;   %Polar Second Moment of Inertia
T=loads*(g*d1);    %Torque applied on the rod
y=(T*(d/2))/J;      %Shear Stress in Pa

x=(theta*(d/2))/L;     %Shear Strain 

coefficients=polyfit(x,y,1);  %finds coeff of best fit line for Data
xFit = linspace(min(x),max(x),1000);
yFit = polyval(coefficients,xFit);
G_in_Pa=coefficients(1);  %slope of the best fit line gives Shear Modulus

%to see full value of slope, use command 'format long'

%str=sprintf('%f Pascals',G_in_Pa);
%str ='28875391321.054501 Pascals'

%str=sprintf('%g Pascals',G_in_Pa);
%str ='2.88754e+10 Pascals'

G_in_GPa(4)=G_in_Pa/1e9;
 

%disp(sprintf('Slop of best fit line theta(radian) vs mass(kg) : %g',slope));

%str=sprintf('%g GPa',G_in_GPa)
%str = '2.88754 GPa'


%%% PLOTTING GRAPH
hold on;
plot(xFit,yFit,'r-','LineWidth',2)
scatter(x,y);
xlabel('Shear Strain (in radians)');
ylabel('Shear Stress (in Pa)');
title({sprintf('Exp 4 Cycle 1  G:%g GPa',G_in_GPa(4))})
hold off;
figure; %to plot different plots in different windows















%GROUP 5

%Takes values of load from m_exp1 variable of P8_TorsionTest.mat
loads = m_exp5;

%Takes values of theta from column i of theta_0exp1 variable of P8...mat 
theta =theta_0exp5(:,1);    %change cycle number here for data.Taking Cycle 1

%plot(loads,theta); %Plots original y_vs_x Data
theta=theta'; %to make y and x of same dimensions since theta was columnar

J=pi*(d^4)/32;   %Polar Second Moment of Inertia
T=loads*(g*d1);    %Torque applied on the rod
y=(T*(d/2))/J;      %Shear Stress in Pa

x=(theta*(d/2))/L;     %Shear Strain 

coefficients=polyfit(x,y,1);  %finds coeff of best fit line for Data
xFit = linspace(min(x),max(x),1000);
yFit = polyval(coefficients,xFit);
G_in_Pa=coefficients(1);  %slope of the best fit line gives Shear Modulus

%to see full value of slope, use command 'format long'

%str=sprintf('%f Pascals',G_in_Pa);
%str ='28875391321.054501 Pascals'

%str=sprintf('%g Pascals',G_in_Pa);
%str ='2.88754e+10 Pascals'

G_in_GPa(5)=G_in_Pa/1e9;


%disp(sprintf('Slop of best fit line theta(radian) vs mass(kg) : %g',slope));

%str=sprintf('%g GPa',G_in_GPa)
%str = '2.88754 GPa'


%%% PLOTTING GRAPH
hold on;
plot(xFit,yFit,'r-','LineWidth',2)
scatter(x,y);
xlabel('Shear Strain (in radians)');
ylabel('Shear Stress (in Pa)');
title({sprintf('Exp 5 Cycle 1  G:%g GPa',G_in_GPa(5))})
hold off;
%figure; %not at the last since it creates another extra plot

%hold off;  %%used to stop plotting on the same window

clearvars -except G_in_GPa



