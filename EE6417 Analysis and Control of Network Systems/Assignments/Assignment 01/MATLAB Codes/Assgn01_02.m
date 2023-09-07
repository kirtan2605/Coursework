clc; clear;

% for n = 5

theta_0 = sort(mod(rand(5,1,'double')*10, 2*pi));
K = 0.7;

% system_dynamics = 'A', 'B'
system_dynamics = 'A';

control_difference_equilibrium = 0.01;
step_limit = 10000;
step_count = 0;

theta_evolution = zeros([5 1]);
theta_evolution(:,1) = theta_0;

theta_diff_ahead = [[-1, 1, 0, 0, 0];
                    [0, -1, 1, 0, 0];
                    [0, 0, -1, 1, 0];
                    [0, 0, 0, -1, 1];
                    [1, 0, 0, 0, -1]];

theta_diff_behind = [[1, 0, 0, 0, -1];
                     [-1, 1, 0, 0, 0];
                     [0, -1, 1, 0, 0];
                     [0, 0, -1, 1, 0];
                     [0, 0, 0, -1, 1]];

equilibrium_search = 1;

%% system dynamics
switch system_dynamics
    case 'A'
       while equilibrium_search
           u = K * mod( theta_diff_ahead*theta_evolution(:,end), 2*pi);
           theta_evolution = [theta_evolution, mod( theta_evolution(:,end) + u, 2*pi)];
           control_difference = max(abs(u)) - min(abs(u));
           if control_difference < control_difference_equilibrium
               equilibrium_search = 0;
           end

           step_count = step_count + 1;
           if step_count > step_limit
               disp('No equilibrium condition found.')
               break
           end

       end

    case 'B'
       while equilibrium_search
           u = K * (mod( theta_diff_ahead*theta_evolution(:,end), 2*pi) - mod( theta_diff_behind*theta_evolution(:,end), 2*pi));
           theta_evolution = [theta_evolution, mod( theta_evolution(:,end) + u, 2*pi)];
           control_difference = max(abs(u)) - min(abs(u));
           if control_difference < control_difference_equilibrium
               equilibrium_search = 0;
           end

           step_count = step_count + 1;
           if step_count > step_limit
               disp('No equilibrium condition found.')
               break
           end

       end
end


%% plotting evolution of states to equilibrium only if equilibrium is attained
if step_count <= step_limit

% plotting the evolution of states in 2D
figure
hold on
plot(theta_evolution', 'x-');
grid on;
title(strcat('Evolution of bot position angles for control law ', system_dynamics, " and K ", string(K)))
xlabel('iteration step')
ylabel('Position Angle')
legend('Bot1', 'Bot2', 'Bot3', 'Bot4', 'Bot5' )
hold off;


% plotting the evolution of states in 3D
figure
r = 100;
x_evolution = r*cos(theta_evolution);
y_evolution = r*sin(theta_evolution);

time = linspace(1, length(x_evolution), length(x_evolution));

plot3(x_evolution', y_evolution',time, 'LineWidth',3)
grid on;
title(strcat('Evolution of bot position angles for control law ', system_dynamics, " and K ", string(K)))
xlabel('x')
ylabel('y')
zlabel('time')
legend('Bot1', 'Bot2', 'Bot3', 'Bot4', 'Bot5' )
end
