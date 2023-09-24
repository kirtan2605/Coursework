%% ---- Kirtan Patel -- Sep 24 2023 -------------
% modified from the MATLAB function by Chao Huang

clear all

%% initial conditions [x(km) y(km) z(km) Vx(km/s) Vy(km/s) Vz(km/s) m(kg)]
% inclined elliptical orbit
%w0 = [-6621.949926 -485.079670 -766.522384 -0.009311 -9.175045 -4.536935 5233.5];

% inclined circular orbit starting from equatorial plane
w0 = [-7521.949926 0 0 0 -3.175045 2.9311  5233.5];

Re=6378.14; %[km]
u=3.986005*10^5;        % [km^3/s^2] G*M for earth
% calculate velocity for ciruclar orbit
r=sqrt(w0(1)^2+w0(2)^2+w0(3)^2);
v_orbital_circular = sqrt(u/r);
v_orbital = sqrt(w0(4)^2+w0(5)^2+w0(6)^2);
% changing Vz to make orbit circular
Vz_circular = sqrt(v_orbital_circular^2 - w0(4)^2 -w0(5)^2);
w0(6) = Vz_circular;
v_orbital = sqrt(w0(4)^2+w0(5)^2+w0(6)^2);
%disp(w0);

%%
options = odeset('RelTol',1e-12,'AbsTol',1e-12);
% 'Refine' was used to produce good-looking plots
% default value of Refine was 4. Tolerances were also tightened.
% scalar relative error tolerance 'RelTol' (1e-3 by default) and
% vector of absolute error tolerances 'AbsTol' (all components 1e-6 by
% default).

%[progate firing propagte2 firing2 ]
time_period = (sqrt(((r^3)*4*(pi^2))/u))/60; % time period [min]
time_vec = [time_period 2*time_period 3*time_period 4*time_period]; %time vector [min]

%------ propogare t=0 to t=timeperiod ----------------
sample_qty = (time_vec(1)-0)*2;
time_info = linspace(0,(time_vec(1)-0)*60,sample_qty);
[t1,y1] = ode45(@eq_propagate,time_info,w0,options);

%------ propulse t=timeperiod to t=2xtimeperiod ----------------
sample_qty = (time_vec(2)-time_vec(1))*50;
time_info = linspace(0,(time_vec(2)-time_vec(1))*60,sample_qty);
l_v=length(t1); %last value
[t2,y2] = ode45(@eq_propulse,time_info,y1(l_v,:),options);

%------- propagate -----------
sample_qty = (time_vec(3)-time_vec(2))*2;     %every minute
time_info = linspace(0,(time_vec(3)-time_vec(2))*60,sample_qty);
l_v=length(t2); %last value
[t3,y3] = ode45(@eq_propagate,time_info,y2(l_v,:),options);  %J2



%% -------------Ploting---------

% ColorSet = [
% 	0.00  0.00  1.00
%     1.00  0.00  0.00 
% 	0.00  0.50  0.00 
% 	0.00  0.75  0.75
% 	0.75  0.00  0.75
% 	0.75  0.75  0.00 
% 	0.25  0.25  0.25
% 	0.75  0.25  0.25
% 	0.95  0.95  0.00 
% 	0.25  0.25  0.75
% 	0.75  0.75  0.75
% 	0.00  1.00  0.00 
% 	0.76  0.57  0.17
% 	0.54  0.63  0.22
% 	0.34  0.57  0.92
% 	1.00  0.10  0.60
% 	0.88  0.75  0.73
% 	0.10  0.49  0.47
% 	0.66  0.34  0.65
% 	0.99  0.41  0.23
% ];
% 
% set(0,'DefaultAxesColorOrder',ColorSet); %set to all




%set(gca, 'ColorOrder', ColorSet);
% figure
% hold all;
% for m = 1:50
%   plot([0 51-m], [0 m]);
% end
% 
% 


%{

%-------------Plot---------------------
close all;
figure;
hold on;
%---plot position---


y = [y1(:,1:3);
    
    y2(:,1:3);]; %
t = [t1; 
    
    time_vec(1)*60; 
    time_vec(2)*60+t2 ; 
    
   
    time_vec(3)*60;];

subplot(3,1,1);
plot(t,y);
legend('x','y','z');
xlabel('Time [seg]');
ylabel('Inertial Position [km]');

%---plot velocity---

y = [y1(:,4:6);
    y2(:,4:6);]; %
subplot(3,1,2);
plot(t,y);
legend('Vx','Vy','Vz');
xlabel('Time [seg]');
ylabel('Inertial Velocity [km/s]');

%---plot Mass---

y = [y1(:,7);
    
    y2(:,7);]; %
subplot(3,1,3);
plot(t,y);
legend('Mass Consuption');
xlabel('Time [seg]');
ylabel('Mass [kg]');

%}

%---------------------Ploting X Y Z------------------

figure;
hold all; % no reset color order
[earth_x,earth_y,earth_z] = sphere;
surf (earth_x*Re,earth_y*Re,earth_z*Re)
%mesh (earth_x*Re,earth_y*Re,earth_z*Re);
%plot3 (earth_x*Re,earth_y*Re,earth_z*Re)
[x_plane y_plane] = meshgrid(-10000:5000:10000); % Generate x and y data
z_plane = zeros(size(x_plane, 1)); % Generate z data
%surf(x_plane, y_plane, z_plane) % Plot the surface
mesh(x_plane, y_plane, z_plane) % Plot themesh
plot(w0(1),w0(2),'.')

%plot3(y1(:,1),y1(:,2),y1(:,3));
%plot3(y2(:,1),y2(:,2),y2(:,3));
%plot3(y3(:,1),y3(:,2),y3(:,3));


%plot3(0,0,0,'-*')


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



%%

%figure 
%hold all
 %[a, e_mag, i, Omega, w, nu, w_true, lambda_true, arg_latt_u] = elorb(yf5(1,1:3)',yf5(legth(yf5),4:6)')
 %plot(tf5,a,'*')

%  [a, e_mag, i, Omega, w, nu, w_true, lambda_true, arg_latt_u] = elorb(yf5(length(yf5),1:3)',yf5(length(yf5),4:6)')
%  plot(2,i,'*')
%  
%   [a, e_mag, i, Omega, w, nu, w_true, lambda_true, arg_latt_u] = elorb(y6(1,1:3)',y6(1,4:6)')
%  plot(3,i,'*')
% 
%  [a, e_mag, i, Omega, w, nu, w_true, lambda_true, arg_latt_u] = elorb(y6(length(yf5),1:3)',y6(length(yf5),4:6)')
%  plot(4,i,'*')
 
%figure
%plot(ts1,ys1(:,7)) %sinking mass







  %[a(1), e_mag(1), i(1), Omega(1), w(1), nu(1), w_true(1), lambda_true(1), arg_latt_u(1)] = elorb(y1(1,1:3)',y1(1,4:6)')
  %[a(2), e_mag(2), i(2), Omega(2), w(2), nu(2), w_true(2), lambda_true(2), arg_latt_u(2)] = elorb(y2(1,1:3)',y2(1,4:6)')
  %[a(3), e_mag(3), i(3), Omega(3), w(3), nu(3), w_true(3), lambda_true(3), arg_latt_u(3)] = elorb(y3(1,1:3)',y3(1,4:6)')
  %[a(4), e_mag(4), i(4), Omega(4), w(4), nu(4), w_true(4), lambda_true(4), arg_latt_u(4)] = elorb(y4(1,1:3)',y4(1,4:6)')
  %[a(5), e_mag(5), i(5), Omega(5), w(5), nu(5), w_true(5), lambda_true(5), arg_latt_u(5)] = elorb(y5(1,1:3)',y5(1,4:6)')
  %[a(6), e_mag(6), i(6), Omega(6), w(6), nu(6), w_true(6), lambda_true(6), arg_latt_u(6)] = elorb(y6(1,1:3)',y6(1,4:6)')
  
  %x_axis = 1:6;
  
  
  %figure
  %subplot(3,2,1);
  %plot(a,'-s')
  %title('semi-major axis [Km]');
  %strValues = strtrim(cellstr(num2str([a'],'%g')));
  %text(x_axis,a,strValues,'VerticalAlignment','bottom','fontsize',8,'color','k');
  
  %subplot(3,2,2);
  %plot(e_mag,'-s')
  %title('eccentricity magnitude []');
  %strValues = strtrim(cellstr(num2str([e_mag'],'%g')));
  %text(x_axis,e_mag,strValues,'VerticalAlignment','bottom','fontsize',8,'color','k');
  
  %subplot(3,2,3);
  %plot(Omega*180/pi,'-s')
  %title('RAAN [deg]');
  %strValues = strtrim(cellstr(num2str([Omega'*180/pi],'%g')));
  %text(x_axis,Omega*180/pi,strValues,'VerticalAlignment','bottom','fontsize',8,'color','k');
  
  %subplot(3,2,4);
%   plot(i*180/pi,'-s')
%   title('Inclination [deg]');
%   strValues = strtrim(cellstr(num2str([i'*180/pi],'%g')));
%   text(x_axis,i*180/pi,strValues,'VerticalAlignment','bottom','fontsize',8,'color','k');
%   
%   subplot(3,2,5);
%   plot(w*180/pi,'-s')
%   title('Argument of Perigee [deg]');
%   strValues = strtrim(cellstr(num2str([w'*180/pi],'%g')));
%   text(x_axis,w*180/pi,strValues,'VerticalAlignment','bottom','fontsize',8,'color','k');
%   
%   subplot(3,2,6);
%   plot(nu*180/pi,'-s')
%   title('True Anomaly [deg]');
%   strValues = strtrim(cellstr(num2str([nu'*180/pi],'%g')));
%   text(x_axis,nu*180/pi,strValues,'VerticalAlignment','bottom','fontsize',8,'color','k');
  
  











%figure;
%grid on;
%hold on;
%[earth_x,earth_y,earth_z] = sphere;
%mesh (earth_x*Re,earth_y*Re,earth_z*Re);
%graphic_position_thrust_vector(yf1(1,1),yf1(1,2),yf1(1,3), -22.3*pi/180, 0);
%graphic_position_thrust_vector(yf1(length(yf1),1),yf1(length(yf1),2),yf1(length(yf1),3), -22.3*pi/180, 0);



%xlabel('X');
%ylabel('Y');
%zlabel('Z');
%title('Vector of Position and Thruster');
%legend('Earth','start 1 firing','end 1 firing');
