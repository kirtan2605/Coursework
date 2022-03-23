% Model Definition (in mm)
N1 = [0,0];
N2 = [5000,0];
N3 = [10000,0];
N4 = [15000,0];
N5 = [20000,0];
N6 = [5000,5000];
N7 = [10000,5000];
N8 = [15000,5000];


% Initializing other parameters
E = 210000;     % in N/mm^2
A1to9 = 500;     % in mm^2
A10to13 = 200;   % in mm^2


% Calculating Local Stiffness Matrix for all elements
K1_loc = k_local(E,A1to9,N1,N2);
K2_loc = k_local(E,A1to9,N2,N3);
K3_loc = k_local(E,A1to9,N3,N4);
K4_loc = k_local(E,A1to9,N4,N5);
K5_loc = k_local(E,A1to9,N1,N6);
K6_loc = k_local(E,A1to9,N6,N7);
K7_loc = k_local(E,A1to9,N7,N8);
K8_loc = k_local(E,A1to9,N8,N5);
K9_loc = k_local(E,A1to9,N2,N6);
K10_loc = k_local(E,A10to13,N3,N7);
K11_loc = k_local(E,A10to13,N4,N8);
K12_loc = k_local(E,A10to13,N6,N3);
K13_loc = k_local(E,A10to13,N3,N8);


% Calculating Global Stiffness Matrix for all elements
R_up = rotationmat(5000,5000);
R_down = rotationmat(5000,-5000);
R_vertical = rotationmat(0,5000);
% elements already oriented in the x-direction need not be rotated.
K1_glob = K1_loc;
K2_glob = K2_loc;
K3_glob = K3_loc;
K4_glob = K4_loc;
K5_glob = R_up'*K5_loc*R_up;
K6_glob = K6_loc;
K7_glob = K7_loc;
K8_glob = R_down'*K8_loc*R_down;
K9_glob = R_vertical'*K9_loc*R_vertical;
K10_glob = R_vertical'*K10_loc*R_vertical;
K11_glob = R_vertical'*K11_loc*R_vertical;
K12_glob = R_down'*K12_loc*R_down;
K13_glob = R_up'*K13_loc*R_up;

% initializing the degrees of freedom of each elements
L1 = [1,3];
L2 = [3,5];
L3 = [5,7];
L4 = [7,9];
L5 = [1,2,11,12];
L6 = [11,13];
L7 = [13,15];
L8 = [15,16,9,10];
L9 = [3,4,11,12];
L10 = [5,6,13,14];
L11 = [7,8,15,16];
L12 = [11,12,5,6];
L13 = [5,6,15,16];

% initializing Global Stiffness Matrix
K = zeros(16);
K(L1,L1) = K(L1,L1) + K1_glob;
K(L2,L2) = K(L2,L2) + K2_glob;
K(L3,L3) = K(L3,L3) + K3_glob;
K(L4,L4) = K(L4,L4) + K4_glob;
K(L5,L5) = K(L5,L5) + K5_glob;
K(L6,L6) = K(L6,L6) + K6_glob;
K(L7,L7) = K(L7,L7) + K7_glob;
K(L8,L8) = K(L8,L8) + K8_glob;
K(L9,L9) = K(L9,L9) + K9_glob;
K(L10,L10) = K(L10,L10) + K10_glob;
K(L11,L11) = K(L11,L11) + K11_glob;
K(L12,L12) = K(L12,L12) + K12_glob;
K(L13,L13) = K(L13,L13) + K13_glob;

% disp(K)

% to reduce K , remove rows and columns 1, 2, 10
K_red = K([3:9,11:16],[3:9,11:16]);

% initializing Force vector without Reaction forced
F = zeros(16,1);
F(4,1) = -5000;     % in N
F(6,1) = -5000;     % in N
F(8,1) = -5000;     % in N
F_red = F([3:9,11:16],1);

% finding reduced displacement
u_red = K_red\F_red;

u_total = zeros(16,1);
u_total([3:9,11:16],1) = u_red;
%disp(u_total)

% finding reaction forces
F_total = K*u_total;

%% calculating elongation using rotation matrices

% finding u_global for all elements
u1_glob = u_total(L1);
u2_glob = u_total(L2);
u3_glob = u_total(L3);
u4_glob = u_total(L4);
u5_glob = u_total(L5);
u6_glob = u_total(L6);
u7_glob = u_total(L7);
u8_glob = u_total(L8);
u9_glob = u_total(L9);
u10_glob = u_total(L10);
u11_glob = u_total(L11);
u12_glob = u_total(L12);
u13_glob = u_total(L13);

% finding u_local for all elements
u1_loc = u1_glob;
u2_loc = u2_glob;
u3_loc = u3_glob;
u4_loc = u4_glob;
u5_loc = R_up*u5_glob;
u6_loc = u6_glob;
u7_loc = u7_glob;
u8_loc = R_down*u8_glob;
u9_loc = R_vertical*u9_glob;
u10_loc = R_vertical*u10_glob;
u11_loc = R_vertical*u11_glob;
u12_loc = R_down*u12_glob;
u13_loc = R_up*u13_glob;

% finding force in elements using local displacement matrix
% finding force matrix [Fi Fj]
u1_f = K1_loc*u1_loc;
u2_f = K2_loc*u2_loc;
u3_f = K3_loc*u3_loc;
u4_f = K4_loc*u4_loc;
u5_f = K5_loc*u5_loc;
u6_f = K6_loc*u6_loc;
u7_f = K7_loc*u7_loc;
u8_f = K8_loc*u8_loc;
u9_f = K9_loc*u9_loc;
u10_f = K10_loc*u10_loc;
u11_f = K11_loc*u11_loc;
u12_f = K12_loc*u12_loc;
u13_f = K13_loc*u13_loc;

% we get a matrix [Fi Fj], element force F = Fj = -Fi
% element force in kN
u1_force_matrix = u1_f(2)*(1e-3);
u2_force_matrix = u2_f(2)*(1e-3);
u3_force_matrix = u3_f(2)*(1e-3);
u4_force_matrix = u4_f(2)*(1e-3);
u5_force_matrix = u5_f(2)*(1e-3);
u6_force_matrix = u6_f(2)*(1e-3);
u7_force_matrix = u7_f(2)*(1e-3);
u8_force_matrix = u8_f(2)*(1e-3);
u9_force_matrix = u9_f(2)*(1e-3);
u10_force_matrix = u10_f(2)*(1e-3);
u11_force_matrix = u11_f(2)*(1e-3);
u12_force_matrix = u12_f(2)*(1e-3);
u13_force_matrix = u12_f(2)*(1e-3);


% finding elongation of each element
u1_elongation = u1_loc(2) - u1_loc(1);
u2_elongation = u2_loc(2) - u2_loc(1);
u3_elongation = u3_loc(2) - u3_loc(1);
u4_elongation = u4_loc(2) - u4_loc(1);
u5_elongation = u5_loc(2) - u5_loc(1);
u6_elongation = u6_loc(2) - u6_loc(1);
u7_elongation = u7_loc(2) - u7_loc(1);
u8_elongation = u8_loc(2) - u8_loc(1);
u9_elongation = u9_loc(2) - u9_loc(1);
u10_elongation = u10_loc(2) - u10_loc(1);
u11_elongation = u11_loc(2) - u11_loc(1);
u12_elongation = u12_loc(2) - u12_loc(1);
u13_elongation = u13_loc(2) - u13_loc(1);

% initial lengths for elongation
u1_i = element_length(N1,N2);
u2_i = element_length(N2,N3);
u3_i = element_length(N3,N4);
u4_i = element_length(N4,N5);
u5_i = element_length(N1,N6);
u6_i = element_length(N6,N7);
u7_i = element_length(N7,N8);
u8_i = element_length(N8,N5);
u9_i = element_length(N2,N6);
u10_i = element_length(N3,N7);
u11_i = element_length(N4,N8);
u12_i = element_length(N6,N3);
u13_i = element_length(N3,N8);

% finding strain
u1_strain = u1_elongation/u1_i;
u2_strain = u2_elongation/u2_i;
u3_strain = u3_elongation/u3_i;
u4_strain = u4_elongation/u4_i;
u5_strain = u5_elongation/u5_i;
u6_strain = u6_elongation/u6_i;
u7_strain = u7_elongation/u7_i;
u8_strain = u8_elongation/u8_i;
u9_strain = u9_elongation/u9_i;
u10_strain = u10_elongation/u10_i;
u11_strain = u11_elongation/u11_i;
u12_strain = u12_elongation/u12_i;
u13_strain = u13_elongation/u13_i;

E = 210000;      % in N/mm^2
% we need the stress in MPa = 10^6 N/m^2
% 1MPa = 1N/mm^2
% finding stress
u1_stress = u1_strain*E;
u2_stress = u2_strain*E;
u3_stress = u3_strain*E;
u4_stress = u4_strain*E;
u5_stress = u5_strain*E;
u6_stress = u6_strain*E;
u7_stress = u7_strain*E;
u8_stress = u8_strain*E;
u9_stress = u9_strain*E;
u10_stress = u10_strain*E;
u11_stress = u11_strain*E;
u12_stress = u12_strain*E;
u13_stress = u13_strain*E;

% finding force in elements (in kN)
u1_force = u1_stress*A1to9*(1e-3); 
u2_force = u2_stress*A1to9*(1e-3);
u3_force = u3_stress*A1to9*(1e-3);
u4_force = u4_stress*A1to9*(1e-3);
u5_force = u5_stress*A1to9*(1e-3);
u6_force = u6_stress*A1to9*(1e-3);
u7_force = u7_stress*A1to9*(1e-3);
u8_force = u8_stress*A1to9*(1e-3);
u9_force = u9_stress*A1to9*(1e-3);
u10_force = u10_stress*A10to13*(1e-3);
u11_force = u11_stress*A10to13*(1e-3);
u12_force = u12_stress*A10to13*(1e-3);
u13_force = u13_stress*A10to13*(1e-3);


%{
%display the elongations
disp(u1_elongation);
disp(u2_elongation);
disp(u3_elongation);
disp(u4_elongation);
disp(u5_elongation);
disp(u6_elongation);
disp(u7_elongation);
disp(u8_elongation);
disp(u9_elongation);
disp(u10_elongation);
disp(u11_elongation);
disp(u12_elongation);
disp(u13_elongation);
%}

%% calculating elongation using pythagoras
% initial lengths
u1_i = element_length(N1,N2);
u2_i = element_length(N2,N3);
u3_i = element_length(N3,N4);
u4_i = element_length(N4,N5);
u5_i = element_length(N1,N6);
u6_i = element_length(N6,N7);
u7_i = element_length(N7,N8);
u8_i = element_length(N8,N5);
u9_i = element_length(N2,N6);
u10_i = element_length(N3,N7);
u11_i = element_length(N4,N8);
u12_i = element_length(N6,N3);
u13_i = element_length(N3,N8);

% initializing final global co-ordinates of nodes
N1(1) = N1(1) + u_total(1);
N1(2) = N1(2) + u_total(2);
N2(1) = N2(1) + u_total(3);
N2(2) = N2(2) + u_total(4);
N3(1) = N3(1) + u_total(5);
N3(2) = N3(2) + u_total(6);
N4(1) = N4(1) + u_total(7);
N4(2) = N4(2) + u_total(8);
N5(1) = N5(1) + u_total(9);
N5(2) = N5(2) + u_total(10);
N6(1) = N6(1) + u_total(11);
N6(2) = N6(2) + u_total(12);
N7(1) = N7(1) + u_total(13);
N7(2) = N7(2) + u_total(14);
N8(1) = N8(1) + u_total(15);
N8(2) = N8(2) + u_total(16);


% final lengths
u1_f = element_length(N1,N2);
u2_f = element_length(N2,N3);
u3_f = element_length(N3,N4);
u4_f = element_length(N4,N5);
u5_f = element_length(N1,N6);
u6_f = element_length(N6,N7);
u7_f = element_length(N7,N8);
u8_f = element_length(N8,N5);
u9_f = element_length(N2,N6);
u10_f = element_length(N3,N7);
u11_f = element_length(N4,N8);
u12_f = element_length(N6,N3);
u13_f = element_length(N3,N8);

% finding elongation after pythagoras theorem
u1_el_py = u1_f - u1_i;
u2_el_py = u2_f - u2_i;
u3_el_py = u3_f - u3_i;
u4_el_py = u4_f - u4_i;
u5_el_py = u5_f - u5_i;
u6_el_py = u6_f - u6_i;
u7_el_py = u7_f - u7_i;
u8_el_py = u8_f - u8_i;
u9_el_py = u9_f - u9_i;
u10_el_py = u10_f - u10_i;
u11_el_py = u11_f - u11_i;
u12_el_py = u12_f - u12_i;
u13_el_py = u13_f - u13_i;











%% Visualization

% Model Definition (in mm)
N1 = [0,0];
N2 = [5000,0];
N3 = [10000,0];
N4 = [15000,0];
N5 = [20000,0];
N6 = [5000,5000];
N7 = [10000,5000];
N8 = [15000,5000];

figure
% plotting the initial framework
hold on
plot([N1(1),N2(1)],[N1(2),N2(2)])
plot([N2(1),N3(1)],[N2(2),N3(2)])
plot([N3(1),N4(1)],[N3(2),N4(2)])
plot([N4(1),N5(1)],[N4(2),N5(2)])
plot([N1(1),N6(1)],[N1(2),N6(2)])
plot([N6(1),N7(1)],[N6(2),N7(2)])
plot([N7(1),N8(1)],[N7(2),N8(2)])
plot([N8(1),N5(1)],[N8(2),N5(2)])
plot([N2(1),N6(1)],[N2(2),N6(2)])
plot([N3(1),N7(1)],[N3(2),N7(2)])
plot([N4(1),N8(1)],[N4(2),N8(2)])
plot([N3(1),N8(1)],[N3(2),N8(2)])
plot([N6(1),N3(1)],[N6(2),N3(2)])
axis equal


% plotting n times exxagerrated displacement
n = 100;
plot([N1(1) + n*u_total(1),N2(1) + n*u_total(3)],[N1(2) + n*u_total(2),N2(2) + n*u_total(4)])
plot([N2(1) + n*u_total(3),N3(1) + n*u_total(5)],[N2(2) + n*u_total(4),N3(2) + n*u_total(6)])
plot([N3(1) + n*u_total(5),N4(1) + n*u_total(7)],[N3(2) + n*u_total(6),N4(2) + n*u_total(8)])
plot([N4(1) + n*u_total(7),N5(1) + n*u_total(9)],[N4(2) + n*u_total(8),N5(2) + n*u_total(10)])
plot([N1(1) + n*u_total(1),N6(1) + n*u_total(11)],[N1(2) + n*u_total(2),N6(2) + n*u_total(12)])
plot([N6(1) + n*u_total(11),N7(1) + n*u_total(13)],[N6(2) + n*u_total(12),N7(2) + n*u_total(14)])
plot([N7(1) + n*u_total(13),N8(1) + n*u_total(15)],[N7(2) + n*u_total(14),N8(2) + n*u_total(16)])
plot([N8(1) + n*u_total(15),N5(1) + n*u_total(9)],[N8(2) + n*u_total(16),N5(2) + n*u_total(10)])
plot([N2(1) + n*u_total(3),N6(1) + n*u_total(11)],[N2(2) + n*u_total(4),N6(2) + n*u_total(12)])
plot([N3(1) + n*u_total(5),N7(1) + n*u_total(13)],[N3(2) + n*u_total(6),N7(2) + n*u_total(14)])
plot([N4(1) + n*u_total(7),N8(1) + n*u_total(15)],[N4(2) + n*u_total(8),N8(2) + n*u_total(16)])
plot([N3(1) + n*u_total(5),N8(1) + n*u_total(15)],[N3(2) + n*u_total(6),N8(2) + n*u_total(16)])
plot([N6(1) + n*u_total(11),N3(1) + n*u_total(5)],[N6(2) + n*u_total(12),N3(2) + n*u_total(6)])
axis equal
hold off
