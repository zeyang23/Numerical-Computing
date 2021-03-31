clear
clc

f=@(x) x^3-x^2-1;
df=@(x) 3*x^2-2*x-1;

x0=1.2;
TOL=1e-6;

x=Newton(f,df,x0,TOL)

fsolve(f,x0)