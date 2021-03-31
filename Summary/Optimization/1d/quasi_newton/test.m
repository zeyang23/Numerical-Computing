clear;
clc;

f = @(x) 3*x.^4+4*x.^3-12*x.^2+5;
TOL = 0.0001;

x0 = -1.5;
dx = 0.001;

[f_min,x,n] = Quasi_Newton(f,x0,dx,TOL);