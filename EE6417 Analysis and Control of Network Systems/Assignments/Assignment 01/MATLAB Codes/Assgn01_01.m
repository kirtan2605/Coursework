clc; clear;

% initializing initial sensor readings randomly
x0 = rand(6,1,'double')*10;

% definign the margin after which we consider convergence to be reached
convergence_margin = 0.01*min(x0);

% setting graph configuration to : 'A', 'B', 'C', 'D'
graph_configuration = 'A';

x_evolution = x0;

%%  averaging algorithm
switch graph_configuration
    case 'A'
       A = [[1/3, 1/3, 0, 0, 0, 1/3];
      [1/3, 1/3, 1/3, 0, 0, 0];
      [0, 1/3, 1/3, 1/3, 0, 0];
      [0, 0, 1/3, 1/3, 1/3, 0];
      [0, 0, 0, 1/3, 1/3, 1/3];
      [1/3, 0, 0, 0, 1/3 , 1/3]];

    case 'B'
       A = [[1/6, 1/6, 1/6, 1/6, 1/6, 1/6];
      [1/6, 1/6, 1/6, 1/6, 1/6, 1/6];
      [1/6, 1/6, 1/6, 1/6, 1/6, 1/6];
      [1/6, 1/6, 1/6, 1/6, 1/6, 1/6];
      [1/6, 1/6, 1/6, 1/6, 1/6, 1/6];
      [1/6, 1/6, 1/6, 1/6, 1/6, 1/6]];

    case 'C'
       A = [[1/6, 1/6, 1/6, 1/6, 1/6, 1/6];
      [1/2, 1/2, 0, 0, 0, 0];
      [1/2, 0, 1/2, 0, 0, 0];
      [1/2, 0, 0, 1/2, 0, 0];
      [1/2, 0, 0, 0, 1/2, 0];
      [1/2, 0, 0, 0, 0, 1/2]];

    case 'D'
      A = [[1/3, 0, 0, 0, 1/3, 1/3];
      [0, 1/2, 1/2, 0, 0, 0];
      [0, 1/3, 1/3, 1/3, 0, 0];
      [0, 0, 1/2, 1/2, 0, 0];
      [1/3, 0, 0, 0, 1/3, 1/3];
      [1/3, 0, 0, 0, 1/3, 1/3]];
end

%% calculating the evolution of states
while 1
      x_evolution = [x_evolution, A*x_evolution(:, end)]; 

      % checking convergence
      if max(abs(x_evolution(:,end)-x_evolution(:,end-1))) < convergence_margin
        break
      end
end

%% plotting the evolution of states
hold on
plot(x_evolution', 'x-');
yline(mean(x0), ':', "Average",'LineWidth',3)
grid on;
title(strcat('Evolution of Node Measurements for Graph  ', graph_configuration))
xlabel('iteration step')
ylabel('Node Value')
legend('Node1', 'Node2', 'Node3', 'Node4', 'Node5', 'Node6' )
