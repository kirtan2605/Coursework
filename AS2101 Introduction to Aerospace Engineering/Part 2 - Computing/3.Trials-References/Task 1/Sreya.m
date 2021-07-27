x = y = linspace(10,-10,40);
[xx,yy] = meshgrid(x,y);
r = sqrt(xx.^2 + yy.^2);

z = (50*sin(r)) + sec(r);

hf = figure()

mesh(x,y,z,'linewidth',4);

print(hf,"Assign.png");