%Global variables
d=0.01;     %Diameter of rod in meters
d1=0.1;     %Length of lever in meters
L=1;        %Length of Rod in meters
g=9.81;     %Value of g in m/s^2
load('P8_TorsionTest.mat');


%% In Anamoly Check we see if any graph has crossed the Elastic limit
%% To do this we plot a quadratic function instead of a linear one 





hold on;    %if we want to plot them in the same window


%Group 1

for i= 1:20
%Takes values of load from m_exp1 variable of P8_TorsionTest.mat
loads = m_exp1;

%Takes values of theta from column i of theta_0exp1 variable of P8...mat 
theta =theta_0exp1(:,i);    %change cycle number here for data. Taking Cycle 1

%plot(loads,theta); %Plots original y_vs_x Data
theta=theta'; %to make y and x of same dimensions since theta was columnar

J=pi*(d^4)/32;   %Polar Second Moment of Inertia
T=loads*(g*d1);    %Torque applied on the rod
y=(T*(d/2))/(J*(10^6));      %Shear Stress in MPa

x=(theta*(d/2))/L;     %Shear Strain 

coefficients=polyfit(x,y,2);  %finds coeff of best fit curve for Data
xFit = linspace(min(x),max(x),1000);
yFit = polyval(coefficients,xFit);

%to see full value of slope, use command 'format long'

%str=sprintf('%f Pascals',G_in_Pa);
%str ='28875391321.054501 Pascals'

%str=sprintf('%g Pascals',G_in_Pa);
%str ='2.88754e+10 Pascals'
 
%str=sprintf('%g GPa',G_in_GPa)
%str = '2.88754 GPa'


%%% PLOTTING GRAPH
plot(xFit,yFit,'r-','LineWidth',2)
xlabel('Shear Strain (in radians)');
ylabel('Shear Stress (in MPa)');
variable = sprintf('Exp 1 Cycle %d',i);
title(variable);
%figure; %%to plot different plots in different windows

end


figure; %To plot each Experiment in new window






hold on;
%GROUP 2

for i=1:20
%Takes values of load from m_exp1 variable of P8_TorsionTest.mat
loads = m_exp2;

%Takes values of theta from column i of theta_0exp1 variable of P8...mat 
theta =theta_0exp2(:,i);    %change cycle number here for data. Taking Cycle 1

%plot(loads,theta); %Plots original y_vs_x Data
theta=theta'; %to make y and x of same dimensions since theta was columnar

J=pi*(d^4)/32;   %Polar Second Moment of Inertia
T=loads*(g*d1);    %Torque applied on the rod
y=(T*(d/2))/(J*(10^6));      %Shear Stress in MPa

x=(theta*(d/2))/L;     %Shear Strain 

coefficients=polyfit(x,y,2);  %finds coeff of best fit curve for Data
xFit = linspace(min(x),max(x),1000);
yFit = polyval(coefficients,xFit);

%to see full value of slope, use command 'format long'

%str=sprintf('%f Pascals',G_in_Pa);
%str ='28875391321.054501 Pascals'

%str=sprintf('%g Pascals',G_in_Pa);
%str ='2.88754e+10 Pascals' 

%str=sprintf('%g GPa',G_in_GPa)
%str = '2.88754 GPa'


%%% PLOTTING GRAPH
plot(xFit,yFit,'r-','LineWidth',2)
xlabel('Shear Strain (in radians)');
ylabel('Shear Stress (in MPa)');
variable = sprintf('Exp 2 Cycle %d',i);
title(variable);
%figure; %to plot different plots in different windows
end

figure; %To plot each Experiment in new window






hold on;

%GROUP 3
for i=1:20
%Takes values of load from m_exp1 variable of P8_TorsionTest.mat
loads = m_exp3;

%Takes values of theta from column i of theta_0exp1 variable of P8...mat 
theta =theta_0exp3(:,i);    %change cycle number here for data. Taking cycle 1

%plot(loads,theta); %Plots original y_vs_x Data
theta=theta'; %to make y and x of same dimensions since theta was columnar

J=pi*(d^4)/32;   %Polar Second Moment of Inertia
T=loads*(g*d1);    %Torque applied on the rod
y=(T*(d/2))/(J*(10^6));      %Shear Stress in MPa

x=(theta*(d/2))/L;     %Shear Strain 

coefficients=polyfit(x,y,2);  %finds coeff of best fit line for Data
xFit = linspace(min(x),max(x),1000);
yFit = polyval(coefficients,xFit);

%to see full value of slope, use command 'format long'

%str=sprintf('%f Pascals',G_in_Pa);
%str ='28875391321.054501 Pascals'

%str=sprintf('%g Pascals',G_in_Pa);
%str ='2.88754e+10 Pascals'

%str=sprintf('%g GPa',G_in_GPa)
%str = '2.88754 GPa'

%%% PLOTTING GRAPH
plot(xFit,yFit,'r-','LineWidth',2)
xlabel('Shear Strain (in radians)');
ylabel('Shear Stress (in MPa)');
variable = sprintf('Exp 3 Cycle %d',i);
title(variable);
%figure; %to plot different plots in different windows
end


figure; %To plot each Experiment in new window 














hold on;

%GROUP 4

for i=1:20
%Takes values of load from m_exp1 variable of P8_TorsionTest.mat
loads = m_exp4;

%Takes values of theta from column i of theta_0exp1 variable of P8...mat 
theta =theta_0exp4(:,i);    %change cycle number here for data. Taking Cycle 1

%plot(loads,theta); %Plots original y_vs_x Data
theta=theta'; %to make y and x of same dimensions since theta was columnar

J=pi*(d^4)/32;   %Polar Second Moment of Inertia
T=loads*(g*d1);    %Torque applied on the rod
y=(T*(d/2))/(J*(10^6));      %Shear Stress in MPa

x=(theta*(d/2))/L;     %Shear Strain 

coefficients=polyfit(x,y,2);  %finds coeff of best fit curve for Data
xFit = linspace(min(x),max(x),1000);
yFit = polyval(coefficients,xFit);

%to see full value of slope, use command 'format long'

%str=sprintf('%f Pascals',G_in_Pa);
%str ='28875391321.054501 Pascals'

%str=sprintf('%g Pascals',G_in_Pa);
%str ='2.88754e+10 Pascals'

%str=sprintf('%g GPa',G_in_GPa)
%str = '2.88754 GPa'


%%% PLOTTING GRAPH
plot(xFit,yFit,'r-','LineWidth',2)
xlabel('Shear Strain (in radians)');
ylabel('Shear Stress (in MPa)');
variable = sprintf('Exp 4 Cycle %d',i);
title(variable);
%figure; %to plot different plots in different windows
end

figure; %To plot each Experiment in new window




hold on;

%GROUP 5

for i=1:20
%Takes values of load from m_exp1 variable of P8_TorsionTest.mat
loads = m_exp5;

%Takes values of theta from column i of theta_0exp1 variable of P8...mat 
theta =theta_0exp5(:,i);    %change cycle number here for data.Taking Cycle 1

%plot(loads,theta); %Plots original y_vs_x Data
theta=theta'; %to make y and x of same dimensions since theta was columnar

J=pi*(d^4)/32;   %Polar Second Moment of Inertia
T=loads*(g*d1);    %Torque applied on the rod
y=(T*(d/2))/(J*(10^6));      %Shear Stress in MPa

x=(theta*(d/2))/L;     %Shear Strain 

coefficients=polyfit(x,y,2);  %finds coeff of best fit line for Data
xFit = linspace(min(x),max(x),1000);
yFit = polyval(coefficients,xFit);

%to see full value of slope, use command 'format long'

%str=sprintf('%f Pascals',G_in_Pa);
%str ='28875391321.054501 Pascals'

%str=sprintf('%g Pascals',G_in_Pa);
%str ='2.88754e+10 Pascals'

%str=sprintf('%g GPa',G_in_GPa)
%str = '2.88754 GPa'


%%% PLOTTING GRAPH
plot(xFit,yFit,'r-','LineWidth',2)
xlabel('Shear Strain (in radians)');
ylabel('Shear Stress (in MPa)');
variable = sprintf('Exp 5 Cycle %d',i);
title(variable);
%figure; %to plot different plots in different windows
end


%hold off;  %%used to stop plotting on the same window

clear



