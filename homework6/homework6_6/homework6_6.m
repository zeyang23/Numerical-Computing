clear
clc
addpath(genpath('.'));

f = @(t) 2./sqrt(pi).*exp(-t.^2);

a0 = 0;
b0 = 3;
TOL = 1e-8;

fprintf('trapezoid\n')
I1=ERF_Trapezoid(3);
disp(I1)
fprintf('subintervals\n')
[~,n1]=Adaptive_Quadrature_Trap(f,a0,b0,TOL);
disp(n1)

fprintf('simpson\n')
I2=ERF_Simpson(3);
disp(I2)
fprintf('subintervals\n')
[~,n2]=Adaptive_Quadrature_Simp(f,a0,b0,TOL);
disp(n2)

rmpath(genpath('.'));