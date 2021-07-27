num1 = 1;
num2 = 0;

try
  error_catch = 7/num1;
catch
  disp("Matrix is not invertible");
end
%

disp("No Error to catch in num1")


try
  error_catch = 7/num2;
catch
  disp("Matrix is not invertible");
end
%

disp("No Error to catch in num2")