clear
clc

f=@(x) x^3-x^2-1;
x0=2;
x1=1;
TOL=1e-6;

x=Secant(f,x0,x1,TOL)

fsolve(f,x0)
