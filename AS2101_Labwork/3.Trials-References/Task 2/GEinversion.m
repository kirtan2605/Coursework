% This only works for Square Matrices
A = [11 9 10;12 2 8;4 6 5];
disp("Initial Matrix A")
disp(A);
initial_A = A;
N = rows(A); % since rows = columns in square matrix
%disp(N)
inv_A = eye(N);
%disp("Initial Matrix inv_A")
%disp(inv_A)
%{
This code works on the theory that,
we can reduce a square matrix A to Identity matrix(I)
by using simple row operations.
The same row operations when performed on I,
give the inverse of the square matrix A
Using Augmented MAtrix 
%}

for i=1:N 
    for j=1:N 
       if(i!=j)
           ratio = A(j,i)/A(i,i);   
           for k = 1:N
                A(j,k) = A(j,k) - (ratio*A(i,k));
                inv_A(j,k) = inv_A(j,k) - (ratio*inv_A(i,k));
                %disp(A);
            endfor
        endif
     endfor
 endfor
%
%disp(A)
for i=1:N 
  value = A(i,i);
     for j =1:N 
         A(i,j) = A(i,j)/value;
         inv_A(i,j) = inv_A(i,j)/value;
         %disp(A);
     endfor
 endfor 
 %

%{
disp("Final Matrix A")
disp(A);

disp("inv_A")
disp(inv_A)
% Checking if the inverse found is correct

should_be_I = inv_A*initial_A;
disp("Should be I")
disp(should_be_I);
%}