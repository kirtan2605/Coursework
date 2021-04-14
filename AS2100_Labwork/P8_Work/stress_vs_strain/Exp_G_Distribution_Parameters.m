load('Exp_G_Results.mat')

histfit(Exp1');    %To print the normalized histogram
% Create ylabel
ylabel({'Frequency'});
% Create xlabel
xlabel({'Experimental Value of Shear Modulus (in GPa)'});

pd = fitdist(Exp1','Normal');    %Extracts the values of mean,standard deviation of the normal distribution % Take __' bcz we need column vector
standard_deviation(1) = std(pd); %Extracted Standard Deviation stored in standard_deviation
mean_value(1) = mean(pd);   %Extracted mean stored in mean_value
variance(1) = var(pd);  %Extracted variance stores in variance
% Create title
title({sprintf('Experiment 1       mean:%f     std:%f',mean_value(1),standard_deviation(1))});
figure;



histfit(Exp2');    %To print the normalized histogram
% Create ylabel
ylabel({'Frequency'});
% Create xlabel
xlabel({'Experimental Value of Shear Modulus (in GPa)'});


pd = fitdist(Exp2','Normal');    %Extracts the values of mean,standard deviation of the normal % Take __' bcz we need column vector
standard_deviation(2)= std(pd); %Extracted Standard Deviation stored in standard_deviation
mean_value(2) = mean(pd);   %Extracted mean stored in mean_value
variance(2) = var(pd);  %Extracted variance stores in variance
% Create title
title({sprintf('Experiment 2       mean:%f     std:%f',mean_value(2),standard_deviation(2))});
figure;



histfit(Exp3');    %To print the normalized histogram
% Create ylabel
ylabel({'Frequency'});
% Create xlabel
xlabel({'Experimental Value of Shear Modulus (in GPa)'});

pd = fitdist(Exp3','Normal');    %Extracts the values of mean,standard deviation of the normal % Take __' bcz we need column vector
standard_deviation(3) = std(pd); %Extracted Standard Deviation stored in standard_deviation
mean_value(3) = mean(pd);   %Extracted mean stored in mean_value
variance(3) = var(pd);  %Extracted variance stores in variance
% Create title
title({sprintf('Experiment 3       mean:%f     std:%f',mean_value(3),standard_deviation(3))});
figure;



histfit(Exp4');    %To print the normalized histogram
% Create ylabel
ylabel({'Frequency'});
% Create xlabel
xlabel({'Experimental Value of Shear Modulus (in GPa)'});

pd = fitdist(Exp4','Normal');    %Extracts the values of mean,standard deviation of the normal % Take __' bcz we need column vector
standard_deviation(4) = std(pd); %Extracted Standard Deviation stored in standard_deviation
mean_value(4) = mean(pd);   %Extracted mean stored in mean_value
variance(4) = var(pd);  %Extracted variance stores in variance

% Create title
title({sprintf('Experiment 4       mean:%f     std:%f',mean_value(4),standard_deviation(4))});
figure;



histfit(Exp5');    %To print the normalized histogram
% Create ylabel
ylabel({'Frequency'});
% Create xlabel
xlabel({'Experimental Value of Shear Modulus (in GPa)'});
% Create title
title({'Histogram of Experimental Shear Modulus Experiment 5'});

pd = fitdist(Exp5','Normal');    %Extracts the values of mean,standard deviation of the normal % Take __' bcz we need column vector
standard_deviation(5) = std(pd); %Extracted Standard Deviation stored in standard_deviation
mean_value(5) = mean(pd);   %Extracted mean stored in mean_value
variance(5) = var(pd);  %Extracted variance stores in variance
% Create title
title({sprintf('Experiment 5       mean:%f     std:%f',mean_value(5),standard_deviation(5))});
%figure;        %Do not put figure at the end because it initializes a new figure without any plot in it

standard_deviation;
mean_value;
variance;