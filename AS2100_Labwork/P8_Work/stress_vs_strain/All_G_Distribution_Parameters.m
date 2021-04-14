load('Exp_G_Results.mat');

All_G_Results = [Exp1,Exp2,Exp3,Exp4,Exp5];

pd = fitdist(All_G_Results','Normal');    %Extracts the values of mean,standard deviation of the normal % Take __' bcz we need column vector
standard_deviation = std(pd) %Extracted Standard Deviation stored in standard_deviation
mean_value = mean(pd)   %Extracted mean stored in mean_value
variance = var(pd)  %Extracted variance stores in variance