load('G_Results_Cycle1.mat');

bar([1:1:5],Cycle1_G_Values,1);
figure; %To plot other graph in new window

histfit(Cycle1_G_Values);
figure; %To plot other graph in new window BUT NOT AFTER LAST PLOT

histogram(Cycle1_G_Values);


pd = fitdist(Cycle1_G_Values','Normal');    %Extracts the values of mean,standard deviation of the normal % Take __' bcz we need column vector
standard_deviation = std(pd) %Extracted Standard Deviation stored in standard_deviation
mean_value = mean(pd)   %Extracted mean stored in mean_value
variance = var(pd)  %Extracted variance stores in variance