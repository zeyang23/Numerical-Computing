clear
clc
addpath(genpath('.'));

f = @(t) 1+sin(exp(3*t));
a0 = -1;
b0 = 1;
TOL = 0.005;

fprintf('trapezoid\n')
[I1,n1]=Adaptive_Quadrature_Trap(f,a0,b0,TOL);
disp(I1)
fprintf('subintervals\n')
disp(n1)

fprintf('simpson\n')
[I2,n2]=Adaptive_Quadrature_Simp(f,a0,b0,TOL);
disp(I2)
fprintf('subintervals\n')
disp(n2)

rmpath(genpath('.'));