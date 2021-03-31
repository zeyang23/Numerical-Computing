clear;
clc;

f = @(x) 3*x.^4+4*x.^3-12*x.^2+5;
TOL = 0.0001;

a=-2.5;
b=-1.5;

[f_min,x,n] = Golden_Section_Search(f,a,b,TOL);