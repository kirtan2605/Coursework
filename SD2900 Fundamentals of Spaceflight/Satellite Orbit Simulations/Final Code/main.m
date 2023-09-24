%% ---- Kirtan Patel -- Sep 24 2023 -------------
% modified from the MATLAB function by Chao Huang

clear all

%% Define initial conditions [x(km) y(km) z(km) Vx(km/s) Vy(km/s) Vz(km/s) m(kg)]

% inclined circular orbit starting from equatorial plane
w0 = [-7521.949926 0 0 0 -3.2 6.6  5233.5];

Re=6378.14;             %[km]
u=3.986005*10^5;        % [km^3/s^2] G*M for earth

% calculate velocity for ciruclar orbit
r=sqrt(w0(1)^2+w0(2)^2+w0(3)^2);
v_orbital_circular = sqrt(u/r);
v_orbital = sqrt(w0(4)^2+w0(5)^2+w0(6)^2);
% to verify if the velocity enables a circular orbit

%% Calculate Trajectory
options = odeset('RelTol',1e-12,'AbsTol',1e-12);

%[progate firing propagte]
time_period = (sqrt(((r^3)*4*(pi^2))/u))/60;            % time period [min]
time_vec = [time_period 2.075*time_period 4*time_period];   %time vector [min]

%------ propogare ----------------
sample_qty = (time_vec(1)-0)*2;
time_info = linspace(0,(time_vec(1)-0)*60,sample_qty);
[t1,y1] = ode45(@eq_propagate,time_info,w0,options);

%------ propulse ----------------
sample_qty = (time_vec(2)-time_vec(1))*50;
time_info = linspace(0,(time_vec(2)-time_vec(1))*60,sample_qty);
l_v=length(t1); %last value
[t2,y2] = ode45(@eq_propulse,time_info,y1(l_v,:),options);

%------- propagate -----------
sample_qty = (time_vec(3)-time_vec(2))*2;     %every minute
time_info = linspace(0,(time_vec(3)-time_vec(2))*60,sample_qty);
l_v=length(t2); %last value
[t3,y3] = ode45(@eq_propagate,time_info,y2(l_v,:),options);  %J2


%% Plot Trajectory

figure;
hold all; % no reset color order
[earth_x,earth_y,earth_z] = sphere;
%surf (earth_x*Re,earth_y*Re,earth_z*Re)
mesh (earth_x*Re,earth_y*Re,earth_z*Re);
%plot3 (earth_x*Re,earth_y*Re,earth_z*Re)
[x_plane y_plane] = meshgrid(-10000:5000:10000); % Generate x and y data
z_plane = zeros(size(x_plane, 1)); % Generate z data
mesh(x_plane, y_plane, z_plane) % Plot themesh
plot(w0(1),w0(2),'.')


%%

% Create the lines before the loop
% Create the first line with "dummy" data that will be overwritten
myLines(1) = plot3(NaN, NaN, NaN,'LineWidth',1);
% So the second PLOT3 call doesn't clear the first line, turn hold on
%hold on
% Create the second line
myLines(2) = plot3(NaN, NaN, NaN, '-r','LineWidth',1);
% From now on, we're not going to call any high-level plotting function
% So we can turn hold back off
%hold off


%np=100; %number of point for each plot
n_time_faster = 1000; % n*realtime to regulate the speed of simulation
%each_point_time_multi = 2; %each point = 30 s

%total time faster = n_time_faster*each_point_time_multi
time_pause = 30/n_time_faster; % each data =30s 
np = 10; %number of point between each graph
grid on;
axis equal;
view(45, 10);
rotate3d on;

tam = length(t1);
% Perform the plotting

%round(linspace(1,tam,))
for k = 1:np:tam % from ode, each data = 30s
    pause(time_pause); 
    set(myLines(1), 'XData', y1(1:k-1,1), 'YData', y1(1:k-1,2), 'ZData', y1(1:k-1,3));
    set(myLines(2), 'Marker','o','XData', y1(k,1), 'YData', y1(k,2), 'ZData', y1(k,3));
    drawnow;
end


myLines(1) = plot3(NaN, NaN, NaN,'LineWidth',1);
tam = length(y2);
% Perform the plotting
for k = 1:np:tam % I try to avoid using i as a loop variable
    pause(time_pause);
    set(myLines(1), 'XData', y2(1:k,1), 'YData', y2(1:k,2), 'ZData', y2(1:k,3));
    set(myLines(2), 'Marker','o','XData', y2(k,1), 'YData', y2(k,2), 'ZData', y2(k,3));
    drawnow;
end

myLines(1) = plot3(NaN, NaN, NaN,'LineWidth',1);
tam = length(y3);
% Perform the plotting
for k = 1:np:tam % I try to avoid using i as a loop variable
    pause(time_pause);
    set(myLines(1), 'XData', y3(1:k,1), 'YData', y3(1:k,2), 'ZData', y3(1:k,3));
    set(myLines(2), 'Marker','o','XData', y3(k,1), 'YData', y3(k,2), 'ZData', y3(k,3));
    drawnow;
end
