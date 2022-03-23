function [R] = rotationmat(x,y)
% Determine the rotationmatrix for a truss element under
% an angle, using coordinates (x,y) seen from (0,0).
length = sqrt(x^2 + y^2);
sinphi = y / length;
cosphi = x / length;
R = [ cosphi, sinphi, 0, 0; 0, 0, cosphi, sinphi ];