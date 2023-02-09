v1 = linspace(-1,1,101);
v2 = linspace(-1,1,101); 
[x,y] = meshgrid(v1,v2);
t1 = sin(5*x);
t2 = cos(5*y);
func_value = t1.*t2/5;

hf = figure();
mesh(v1,v2, func_value ,"linewidth",2);

xlabel('x');
ylabel('y');
zlabel('(sin(5x)*cos(5y))/5');
title('Plot of Function : ((sin(5x)*cos(5y))/5')

print (hf, "Octave_3D Plot.png");
