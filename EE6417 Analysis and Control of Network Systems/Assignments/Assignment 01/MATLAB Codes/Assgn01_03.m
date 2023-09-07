clc; clear;

% for n = 5
% choose system_parameters : 1, 2, 3
system_parameters = 3;


%% initializing system parameters
switch system_parameters
    case 1
        theta_0 = mod(rand(5,1,'double')*10, 2*pi);
        omega = [1; 2; 3; 4; 5];
        A = zeros(5,5);

    case 2
        theta_0 = mod([0; (2*pi/5)+0.5; (4*pi/5); (6*pi/5)+0.1; (8*pi/5)], 2*pi);
        omega = [5; 5; 5; 5; 5];
        A = [[0, 3, 0, 0, 3];
             [3, 0, 3, 0, 0];
             [0, 3, 0, 3, 0];
             [0, 0, 3, 0, 3];
             [3, 0, 0, 3, 0]];

    case 3
        theta_0 = mod(rand(5,1,'double')*10, 2*pi);
        omega = [1; 1; 1; 2.5; 2.5];
        A = [[ 0, 10,  0,  0,  0];
             [10,  0, 10,  0,  0];
             [ 0, 10,  0,  1,  0];
             [ 0,  0,  1,  0, 10];
             [ 0,  0,  0, 10,  0]];
       
end

%%
step_limit = 200;

theta_evolution = zeros([5 1]);
theta_hat_evolution = zeros([5 1]);
theta_evolution(:,1) = theta_0;
theta_hat_evolution(:,1) = theta_0;

time_step = 0.05;

%% system dynamics
for i = 1:step_limit

    theta_dot = zeros([5 1]);

    for j = 1:5
        phase_coupling = 0;
        for k = 1:5
            phase_coupling = phase_coupling + A(j,k)*sin(theta_evolution(j,i)-theta_evolution(k,i));
        end
        theta_dot(j,1) = omega(j,1) - phase_coupling;
        theta_hat_evolution(j,i) = phase_coupling;
    end
   
    theta_evolution(:,i+1) = theta_evolution(:,i) + theta_dot*time_step;
    theta_evolution(:,i+1) = mod(theta_evolution(:,i+1),2*pi);
    %theta_hat_evolution(:,i) = theta_dot;
    %theta_hat_evolution(:,i) = theta_evolution(:,i) - omega(:,1)*(time_step*(i-1));
    

end


%% plotting evolution of States

% plotting the evolution of states in 2D
figure
hold on
grid on;
plot(theta_hat_evolution','.-', LineWidth=2)
title(strcat('Evolution of $$\hat{\Theta}$$ of Kuramoto Oscillator in System', string(system_parameters)),'Interpreter','Latex')
xlabel('iteration step')
ylabel('$$\hat{\Theta}$$','Interpreter','Latex')
legend('Node1', 'Node2', 'Node3', 'Node4', 'Node5' )
hold off;