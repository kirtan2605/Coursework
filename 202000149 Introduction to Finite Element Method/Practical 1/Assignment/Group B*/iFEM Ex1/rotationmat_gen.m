function [R] = rotationmat_gen(Ni,Nj)
% Determine the rotationmatrix for a truss element under
% an angle, using coordinates (x,y) seen from (0,0).
length = sqrt( (Nj(1)-Ni(1))^2 + (Nj(2)-Ni(2))^2 );
sinphi = (Nj(2)-Ni(2)) / length;
cosphi = (Nj(1)-Ni(1)) / length;
R = [ cosphi, sinphi,0, 0; 0, 0, cosphi, sinphi ];