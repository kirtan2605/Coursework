% run in directory with the dataset text file
DATA = load("-ascii", "data1.txt"); 
% choosing which dataset to operate on
% num_datapoints = rows(DATA);

% creating matrices A and B
num_datapoints = 50 % m decides the number of data points to be used
% m = 50 or 100 or 200

%% Octave has base-index 1
B = DATA(1:num_datapoints,2);
A = [ DATA(1:num_datapoints,1) , ones(num_datapoints,1)];
% Ax = B

% after pre-multiplying A_transpose
% A_transpose = A'
new_A = (A')*A;
new_B = (A')*B;
% (new_A)x = (new_B)
% The new_A(2x2), assuming new_A to be invertible

% Finding the inverse of new_A
mat_A = new_A;
N = rows(mat_A);
inv_A = eye(N);
for i=1:N 
  for j=1:N 
     if(i!=j)
         ratio = mat_A(j,i)/mat_A(i,i);   
         for k = 1:N
              mat_A(j,k) = mat_A(j,k) - (ratio*mat_A(i,k));
              inv_A(j,k) = inv_A(j,k) - (ratio*inv_A(i,k));
          endfor
      endif
   endfor
endfor
%
for i=1:N 
  value = mat_A(i,i);
  for j =1:N 
      mat_A(i,j) = mat_A(i,j)/value;
      inv_A(i,j) = inv_A(i,j)/value;
  endfor
endfor
%

%disp(inv_A)
%disp(new_A * inv_A)

% x = (new_A)^(-1)]*new_B
% x = inv_A * new_B
regression_coefficients = inv_A*new_B;
m = regression_coefficients(1)
c = regression_coefficients(2)
disp(m)
disp(c)


% PLOTTING THE DATA
% Plotting the Scatter plot
h = figure();
hold on;
scatter(DATA(1:num_datapoints,1), DATA(1:num_datapoints,2));
xlabel("X")
ylabel("Y")
title("Dataset1 : 50 Datapoints")

% Plotting the Regression Line
x = 0:50:num_datapoints;
y = m*x + c;
line(x,y,"linewidth",2);
hold off;
print(h,"D1-50.png") %saving the plot