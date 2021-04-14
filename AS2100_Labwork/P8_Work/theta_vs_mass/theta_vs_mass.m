%GLOBAL VARIABLES
load('P8_TorsionTest.mat');
g=9.81;


%GROUP 1
for i=1:20
%Takes values of load from m_exp1 variable of P8_TorsionTest.mat
loads = m_exp1;

%Takes values of theta from column i of theta_0exp1 variable of P8...mat 
theta =theta_0exp1(:,i);    %change cycle number here for data
theta=theta'; %to make y and x of same dimensions since theta was columnar

coefficients=polyfit(loads,theta,1);  %finds coeff of best fit line for Data
xFit = linspace(min(loads),max(loads),1000);
yFit = polyval(coefficients,xFit);
slope=coefficients(1);  %slope of the best fit line

%to see full value of slope use command 'format long'

%further calculations using slope According to Experiment
N= 3.2*g;
D= pi*slope*1e-8;
G_in_Pa=N/D;

%STRING FORMATTING
%str=sprintf('%f Pascals',G_in_Pa);
%str ='28875391321.054501 Pascals'

%str=sprintf('%g Pascals',G_in_Pa);
%str ='2.88754e+10 Pascals'

G_in_GPa=G_in_Pa/1e9;

Exp1(i)=G_in_GPa;
%PRINTS RESULTS
%fprintf('Slope of best fit line theta(radian) vs mass(kg) : %g\n', slope);
%str=sprintf('Shear Modulus of Al 606-T6 : %g GPa\n',G_in_GPa);
%fprintf(str);


%PLOTTING GRAPHS
%plot(xFit,yFit,'r-','LineWidth',2)
%xlabel('mass (in kg)');
%ylabel('theta (in radian)');
%variable = sprintf('Exp 1 Data 1    G : %g GPa',G_in_GPa);
%title(variable);
%save('Exp_1_G_Results','Exp1')
end





%GROUP 2
for i=1:20
    %Takes values of load from m_exp1 variable of P8_TorsionTest.mat
    loads = m_exp2;
    
    %Takes values of theta from column i of theta_0exp1 variable of P8...mat 
    theta =theta_0exp2(:,i);    %change cycle number here for data
    theta=theta'; %to make y and x of same dimensions since theta was columnar
    
    coefficients=polyfit(loads,theta,1);  %finds coeff of best fit line for Data
    xFit = linspace(min(loads),max(loads),1000);
    yFit = polyval(coefficients,xFit);
    slope=coefficients(1);  %slope of the best fit line
    
    %to see full value of slope use command 'format long'
    
    %further calculations using slope According to Experiment
    N= 3.2*g;
    D= pi*slope*1e-8;
    G_in_Pa=N/D;
    
    %STRING FORMATTING
    %str=sprintf('%f Pascals',G_in_Pa);
    %str ='28875391321.054501 Pascals'
    
    %str=sprintf('%g Pascals',G_in_Pa);
    %str ='2.88754e+10 Pascals'
    
    G_in_GPa=G_in_Pa/1e9;
    
    Exp2(i)=G_in_GPa;
    %PRINTS RESULTS
    %fprintf('Slope of best fit line theta(radian) vs mass(kg) : %g\n', slope);
    %str=sprintf('Shear Modulus of Al 606-T6 : %g GPa\n',G_in_GPa);
    %fprintf(str);
    
    
    %PLOTTING GRAPHS
    %plot(xFit,yFit,'r-','LineWidth',2)
    %xlabel('mass (in kg)');
    %ylabel('theta (in radian)');
    %variable = sprintf('Exp 1 Data 1    G : %g GPa',G_in_GPa);
    %title(variable);
    %save('Exp_2_G_Results','Exp2')
    end





%GROUP 3
for i=1:20
    %Takes values of load from m_exp1 variable of P8_TorsionTest.mat
    loads = m_exp3;
    
    %Takes values of theta from column i of theta_0exp1 variable of P8...mat 
    theta =theta_0exp3(:,i);    %change cycle number here for data
    theta=theta'; %to make y and x of same dimensions since theta was columnar
    
    coefficients=polyfit(loads,theta,1);  %finds coeff of best fit line for Data
    xFit = linspace(min(loads),max(loads),1000);
    yFit = polyval(coefficients,xFit);
    slope=coefficients(1);  %slope of the best fit line
    
    %to see full value of slope use command 'format long'
    
    %further calculations using slope According to Experiment
    N= 3.2*g;
    D= pi*slope*1e-8;
    G_in_Pa=N/D;
    
    %STRING FORMATTING
    %str=sprintf('%f Pascals',G_in_Pa);
    %str ='28875391321.054501 Pascals'
    
    %str=sprintf('%g Pascals',G_in_Pa);
    %str ='2.88754e+10 Pascals'
    
    G_in_GPa=G_in_Pa/1e9;
    
    Exp3(i)=G_in_GPa;
    %PRINTS RESULTS
    %fprintf('Slope of best fit line theta(radian) vs mass(kg) : %g\n', slope);
    %str=sprintf('Shear Modulus of Al 606-T6 : %g GPa\n',G_in_GPa);
    %fprintf(str);
    
    
    %PLOTTING GRAPHS
    %plot(xFit,yFit,'r-','LineWidth',2)
    %xlabel('mass (in kg)');
    %ylabel('theta (in radian)');
    %variable = sprintf('Exp 1 Data 1    G : %g GPa',G_in_GPa);
    %title(variable);
    %save('Exp_3_G_Results','Exp3')
    end










%GROUP 4
for i=1:20
    %Takes values of load from m_exp1 variable of P8_TorsionTest.mat
    loads = m_exp4;
    
    %Takes values of theta from column i of theta_0exp1 variable of P8...mat 
    theta =theta_0exp4(:,i);    %change cycle number here for data
    theta=theta'; %to make y and x of same dimensions since theta was columnar
    
    coefficients=polyfit(loads,theta,1);  %finds coeff of best fit line for Data
    xFit = linspace(min(loads),max(loads),1000);
    yFit = polyval(coefficients,xFit);
    slope=coefficients(1);  %slope of the best fit line
    
    %to see full value of slope use command 'format long'
    
    %further calculations using slope According to Experiment
    N= 3.2*g;
    D= pi*slope*1e-8;
    G_in_Pa=N/D;
    
    %STRING FORMATTING
    %str=sprintf('%f Pascals',G_in_Pa);
    %str ='28875391321.054501 Pascals'
    
    %str=sprintf('%g Pascals',G_in_Pa);
    %str ='2.88754e+10 Pascals'
    
    G_in_GPa=G_in_Pa/1e9;
    
    Exp4(i)=G_in_GPa;
    %PRINTS RESULTS
    %fprintf('Slope of best fit line theta(radian) vs mass(kg) : %g\n', slope);
    %str=sprintf('Shear Modulus of Al 606-T6 : %g GPa\n',G_in_GPa);
    %fprintf(str);
    
    
    %PLOTTING GRAPHS
    %plot(xFit,yFit,'r-','LineWidth',2)
    %xlabel('mass (in kg)');
    %ylabel('theta (in radian)');
    %variable = sprintf('Exp 1 Data 1    G : %g GPa',G_in_GPa);
    %title(variable);
    %save('Exp_4_G_Results','Exp4')
    end












%GROUP 5
for i=1:20
    %Takes values of load from m_exp1 variable of P8_TorsionTest.mat
    loads = m_exp5;
    
    %Takes values of theta from column i of theta_0exp1 variable of P8...mat 
    theta =theta_0exp5(:,i);    %change cycle number here for data
    theta=theta'; %to make y and x of same dimensions since theta was columnar
    
    coefficients=polyfit(loads,theta,1);  %finds coeff of best fit line for Data
    xFit = linspace(min(loads),max(loads),1000);
    yFit = polyval(coefficients,xFit);
    slope=coefficients(1);  %slope of the best fit line
    
    %to see full value of slope use command 'format long'
    
    %further calculations using slope According to Experiment
    N= 3.2*g;
    D= pi*slope*1e-8;
    G_in_Pa=N/D;
    
    %STRING FORMATTING
    %str=sprintf('%f Pascals',G_in_Pa);
    %str ='28875391321.054501 Pascals'
    
    %str=sprintf('%g Pascals',G_in_Pa);
    %str ='2.88754e+10 Pascals'
    
    G_in_GPa=G_in_Pa/1e9;
    
    Exp5(i)=G_in_GPa;
    %PRINTS RESULTS
    %fprintf('Slope of best fit line theta(radian) vs mass(kg) : %g\n', slope);
    %str=sprintf('Shear Modulus of Al 606-T6 : %g GPa\n',G_in_GPa);
    %fprintf(str);
    
    
    %PLOTTING GRAPHS
    %plot(xFit,yFit,'r-','LineWidth',2)
    %xlabel('mass (in kg)');
    %ylabel('theta (in radian)');
    %variable = sprintf('Exp 1 Data 1    G : %g GPa',G_in_GPa);
    %title(variable);
    %save('Exp_5_G_Results','Exp5')
    end

save('Exp_G_Results','Exp1','Exp2','Exp3','Exp4','Exp5');

clear
clc