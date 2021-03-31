clear;
clc;

f = @(x) 3*x.^4+4*x.^3-12*x.^2+5;
TOL = 0.0001;

df1 = @(x) 12*x^3+12*x^2-24*x;
df2 = @(x) 36*x^2+24*x-24;

x0 = -1.5;

[f_min,x,n] = Newton(f,df1,df2,x0,TOL);