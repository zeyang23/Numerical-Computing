clear;
clc;

f = @(x) 3*x.^4+4*x.^3-12*x.^2+5;

grad = @(x) 12*x^3+12*x^2-24*x;

alpha_0 = 0.5;
epsilon = 0.2;
w = 0.5;

x0 = -3;

TOL = 0.0001;

[f_min,x,n] = Inaccurate_Line_Search(f,grad,epsilon,w,alpha_0,x0,TOL);