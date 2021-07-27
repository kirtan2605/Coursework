% This only works for Square Matrices
A = [2 3 4 3 ; 4 5 5 7; 5 2 4 9; 1 3 5 2];
disp("Initial Matrix")
disp(A);
N = rows(A); % since rows = columns in square matrix
%disp(N)

%{
This code works on the theory that,
we can reduce a square matrix A to Identity matrix(I)
by using simple row operations.
%}
for i=1:N 
    for j=1:N 
       if(i!=j)
           ratio = A(j,i)/A(i,i);   
           for k = 1:N
                A(j,k) = A(j,k) - (ratio*A(i,k));
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
         %disp(A);
     endfor
 endfor 
 %
 
 disp(A);