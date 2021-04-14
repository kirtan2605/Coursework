%Global variables
d=0.01;     %Diameter of rod in meters
d1=0.1;     %Length of lever in meters
L=1;        %Length of Rod in meters
g=9.81;     %Value of g in m/s^2
load('P8_TorsionTest.mat');






%Group 1

for i=1:20  %iterating through cycles


%Takes values of load from m_exp1 variable of P8_TorsionTest.mat
loads = m_exp1(:,1:7);

%Takes values of theta from column i of theta_0exp1 variable of P8...mat 
theta =(theta_0exp1(1:7,i)+flip(theta_0exp1(7:13,i)))/2;    %change cycle number here for data

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

G_in_GPa=G_in_Pa/1e9;
Exp1(i)=G_in_GPa;
 

%disp(sprintf('Slop of best fit line theta(radian) vs mass(kg) : %g',slope));

%str=sprintf('%g GPa',G_in_GPa)
%str = '2.88754 GPa'


%%% PLOTTING GRAPH
plot(x,y,'r-','LineWidth',2)
xlabel('Shear Strain (in radian)');
ylabel('Shear Stress (in Pa)');
variable = sprintf('Exp 1   G : %g GPa',G_in_GPa);
title(variable);
end

%save('Exp_1_G_Results.mat','Exp1');     %To save individual variables



figure;






%GROUP 2


for i=1:20  %iterates through cycles

%Takes values of load from m_exp1 variable of P8_TorsionTest.mat
loads = m_exp2(:,1:7);

%Takes values of theta from column i of theta_0exp1 variable of P8...mat 
theta =(theta_0exp2(1:7,i)+flip(theta_0exp2(7:13,i)))/2;    %change cycle number here for data

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

G_in_GPa=G_in_Pa/1e9;
Exp2(i)=G_in_GPa;
 

%disp(sprintf('Slop of best fit line theta(radian) vs mass(kg) : %g',slope));

%str=sprintf('%g GPa',G_in_GPa)
%str = '2.88754 GPa'


%%% PLOTTING GRAPH
plot(x,y,'r-','LineWidth',2)
xlabel('Shear Strain (in radian)');
ylabel('Shear Stress (in Pa)');
variable = sprintf('Exp 2   G : %g GPa',G_in_GPa);
title(variable);
end

%save('Exp_2_G_Results.mat','Exp2');     %To save individual variables





figure;









%GROUP 3


for i=1:20  %iterates through cycles

%Takes values of load from m_exp1 variable of P8_TorsionTest.mat
loads = m_exp3(:,1:7);

%Takes values of theta from column i of theta_0exp1 variable of P8...mat 
theta =(theta_0exp3(1:7,i)+flip(theta_0exp3(7:13,i)))/2;    %change cycle number here for data

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

G_in_GPa=G_in_Pa/1e9;
Exp3(i)=G_in_GPa;
 

%disp(sprintf('Slop of best fit line theta(radian) vs mass(kg) : %g',slope));

%str=sprintf('%g GPa',G_in_GPa)
%str = '2.88754 GPa'


%%% PLOTTING GRAPH
plot(x,y,'r-','LineWidth',2)
xlabel('Shear Strain (in radian)');
ylabel('Shear Stress (in Pa)');
variable = sprintf('Exp 3    G : %g GPa',G_in_GPa);
title(variable);
end

%save('Exp_3_G_Results.mat','Exp3');     %To save individual variables





figure;







%GROUP 4


for i=1:20  %Parsing through cycles

%Takes values of load from m_exp1 variable of P8_TorsionTest.mat
loads = m_exp4(:,1:7);

%Takes values of theta from column i of theta_0exp1 variable of P8...mat 
theta =(theta_0exp4(1:7,i)+flip(theta_0exp4(7:13,i)))/2;    %change cycle number here for data

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

G_in_GPa=G_in_Pa/1e9;
Exp4(i)=G_in_GPa;
 

%disp(sprintf('Slop of best fit line theta(radian) vs mass(kg) : %g',slope));

%str=sprintf('%g GPa',G_in_GPa)
%str = '2.88754 GPa'


%%% PLOTTING GRAPH
plot(x,y,'r-','LineWidth',2)
xlabel('Shear Strain (in radian)');
ylabel('Shear Stress (in Pa)');
variable = sprintf('Exp 4    G : %g GPa',G_in_GPa);
title(variable);
end

%save('Exp_4_G_Results.mat','Exp4');     %To save individual variables
















%GROUP 5


for i=1:20  %Parsing through cycles

%Takes values of load from m_exp1 variable of P8_TorsionTest.mat
loads = m_exp5(:,1:7);

%Takes values of theta from column i of theta_0exp1 variable of P8...mat 
theta =(theta_0exp5(1:7,i)+flip(theta_0exp5(7:13,i)))/2;    %change cycle number here for data

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

G_in_GPa=G_in_Pa/1e9;
Exp5(i)=G_in_GPa;
 

%disp(sprintf('Slop of best fit line theta(radian) vs mass(kg) : %g',slope));

%str=sprintf('%g GPa',G_in_GPa)
%str = '2.88754 GPa'


%%% PLOTTING GRAPH
plot(x,y,'r-','LineWidth',2)
xlabel('Shear Strain (in radian)');
ylabel('Shear Stress (in Pa)');
variable = sprintf('Exp 5   G : %g GPa',G_in_GPa);
title(variable);
end

%save('Exp_5_G_Results.mat','Exp5');    %To save individual variables


save('Exp_G_Results.mat','Exp1','Exp2','Exp3','Exp4','Exp5');   %To save all as 1 variable


clear 



