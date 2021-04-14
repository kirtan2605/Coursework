load('Exp_G_Results.mat');

histfit(Exp1);
xlabel('Experimental Shear Modulus (in GPa)')
ylabel('Frequency')
title('Experiment 1')
pd1 = fitdist(Exp1','Normal');    %Extracts the values of mean,standard deviation of the normal % Take __' bcz we need column vector
standard_deviation(1) = std(pd1) %Extracted Standard Deviation stored in standard_deviation
mean_value(1) = mean(pd1)   %Extracted mean stored in mean_value
variance(1) = var(pd1)  %Extracted variance stores in variance
figure; %To plot other graph in new window BUT NOT AFTER LAST PLOT




histfit(Exp2);
xlabel('Experimental Shear Modulus (in GPa)')
ylabel('Frequency')
title('Experiment 2')
pd2 = fitdist(Exp2','Normal');    %Extracts the values of mean,standard deviation of the normal % Take __' bcz we need column vector
standard_deviation(2) = std(pd2) %Extracted Standard Deviation stored in standard_deviation
mean_value(2) = mean(pd2)   %Extracted mean stored in mean_value
variance(2) = var(pd2)  %Extracted variance stores in variance
figure; %To plot other graph in new window BUT NOT AFTER LAST PLOT


histfit(Exp3);
xlabel('Experimental Shear Modulus (in GPa)')
ylabel('Frequency')
title('Experiment 3')
pd3 = fitdist(Exp3','Normal');    %Extracts the values of mean,standard deviation of the normal % Take __' bcz we need column vector
standard_deviation(3) = std(pd3) %Extracted Standard Deviation stored in standard_deviation
mean_value(3) = mean(pd3)   %Extracted mean stored in mean_value
variance(3) = var(pd3)  %Extracted variance stores in variance
figure; %To plot other graph in new window BUT NOT AFTER LAST PLOT

histfit(Exp4);
xlabel('Experimental Shear Modulus (in GPa)')
ylabel('Frequency')
title('Experiment 4')
pd4 = fitdist(Exp4','Normal');    %Extracts the values of mean,standard deviation of the normal % Take __' bcz we need column vector
standard_deviation(4) = std(pd4) %Extracted Standard Deviation stored in standard_deviation
mean_value(4) = mean(pd4)   %Extracted mean stored in mean_value
variance(4) = var(pd4)  %Extracted variance stores in variance
figure; %To plot other graph in new window BUT NOT AFTER LAST PLOT


histfit(Exp5);
xlabel('Experimental Shear Modulus (in GPa)')
ylabel('Frequency')
title('Experiment 5')
pd5 = fitdist(Exp5','Normal');    %Extracts the values of mean,standard deviation of the normal % Take __' bcz we need column vector
standard_deviation(5) = std(pd5) %Extracted Standard Deviation stored in standard_deviation
mean_value(5) = mean(pd5)   %Extracted mean stored in mean_value
variance(5) = var(pd5)  %Extracted variance stores in variance
figure; %To plot other graph in new window BUT NOT AFTER LAST PLOT


