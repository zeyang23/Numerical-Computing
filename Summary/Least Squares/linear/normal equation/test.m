clear
clc

A=[4,2,3,0;
   -2,3,-1,1;
   1,3,-4,2;
   1,0,1,-1;
   3,1,3,-2];

b=[10;0;2;0;5];

x=(transpose(A)*A)\(transpose(A)*b);

r=b-A*x;

r_norm=norm(r);
SE=r_norm^2;
RMSE=r_norm/sqrt(length(r));

fprintf("法线方程的解\n")
disp(x)

fprintf("2_norm\n")
disp(r_norm)
fprintf("SE\n")
disp(SE)
fprintf("RMSE\n")
disp(RMSE)