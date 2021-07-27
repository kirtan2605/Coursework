% GNU octave is a high-level programming
% language similar to Matlab

% What does the function z = sin(r) / r
% where r = sqrt(x^2 + y^2) look like?

tx = ty = linspace(-8,8,41);
[xx,yy] = meshgrid(tx,ty);
r = sqrt(xx.^2 + yy.^2);
% 'dot' implies element-by-element operation

% why does this command work when there
% is a division by zero?
tz = sin(r)./r;

hf = figure()
mesh(tx,ty,tz,"linewidth",2)
xlabel('tx');
ylabel('ty');
zlabel('tz');
