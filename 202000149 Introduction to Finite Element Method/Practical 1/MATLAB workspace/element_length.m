function L = element_length(Ni, Nj)
% Ni, Nj = coordinates node i and node j [x,y]
L = sqrt( (Nj(1)-Ni(1))^2 + (Nj(2)-Ni(2))^2 ); % length element