clear
clc

A=[3,-1,2;
   4,1,0;
   -3,2,1;
   1,1,5;
   -2,0,3];
b=[10;10;-5;15;0];

[m,n]=size(A);
[Q,R]=QR_Houref(A);

d=transpose(Q)*b;

x=R(1:n,:)\d(1:n);

r=d(n+1:end);

norm_r=norm(r);
se=norm_r^2;
rmse=norm_r/sqrt(length(A));

fprintf("最小二乘解\n")
disp(x)
fprintf("残差\n")
fprintf("2_norm\n")
disp(norm_r)
fprintf("SE\n")
disp(se)
fprintf("RMSE\n")
disp(rmse)