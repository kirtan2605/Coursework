%{
This code finds the True Value of G obtained after ignoring the Anamolous Readings of Exp 5
%}
load('Exp_G_Results.mat');  %if this file not present then run Stress_vs_Strain_G.m with P8_Torsion_Test.mat

Exp_G_Non_Anamolous = [Exp1,Exp2,Exp3,Exp4];    %variable to be used to find statistical quantities

pd = fitdist(Exp_G_Non_Anamolous','Normal');    %Extracts the values of mean,standard deviation of the normal % Take __' bcz we need column vector
standard_deviation = std(pd) %Extracted Standard Deviation stored in standard_deviation
mean_value = mean(pd)   %Extracted mean stored in mean_value
variance = var(pd)  %Extracted variance stores in variance