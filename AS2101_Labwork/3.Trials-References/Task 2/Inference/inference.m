D1 = [50 2.0113 1.1880 ;100 2.0080 1.2660 ;200 2.0057 1.3771];
D2 = [50 2.0111 1.1956 ;100 2.0079 1.2719 ;200 2.0056 1.3810];
D3 = [50 2.0000 1.0053 ;100 2.0000 1.0054 ;200 2.0000 1.0049];

% PLOTTING THE DATA

% Plotting the Regression Line Slops
h1 = figure();
line(D1(:,1),D1(:,2),"linewidth",1);
line(D2(:,1),D2(:,2),"linewidth",1);
line(D3(:,1),D3(:,2),"linewidth",1);
ylim([1.9995 2.012])
xlabel("Number of Data Points")
ylabel("Slope of Regression Line")
title("Regression Line Slope")
legend();
print(h1,"Regression Line Slope Plot.png") %saving the plot

% Plotting the Regression Line Slops
h2 = figure();
line(D1(:,1),D1(:,3),"linewidth",1);
line(D2(:,1),D2(:,3),"linewidth",1);
line(D3(:,1),D3(:,3),"linewidth",1);
xlabel("Number of Data Points")
ylabel("Intercepts of Regression Line")
title("Regression Line Intercept")
legend("location","east");
print(h2,"Regression Line intercept Plot.png") %saving the plot
