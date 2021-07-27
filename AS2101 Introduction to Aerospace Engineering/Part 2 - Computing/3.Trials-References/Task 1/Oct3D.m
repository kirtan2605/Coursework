tx = ty = linspace (-8, 8, 41)';
[x, y] = meshgrid (tx, ty);
r = sqrt (x.^ 2 + y.^ 2);
tz = sin (r) ./ r;
mesh (tx, ty, tz);
xlabel ("tx");
ylabel ("ty");
zlabel ("tz");
title ("3D Plot");
