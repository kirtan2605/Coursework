function [K] = k_local( E, A, Ni, Nj )
% E = Elasticity modulus
% A = Cross-section area
% Ni, Nj = coordinates node i and node j [x,y]
L = sqrt( (Nj(1)-Ni(1))^2 + (Nj(2)-Ni(2))^2 ); % length element
B = 1/L * [-1,1];
K = A*L* B'*E*B;