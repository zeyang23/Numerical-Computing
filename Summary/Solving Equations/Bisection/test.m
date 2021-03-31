clear
clc

f=@(x) cos(x);
a=0;
b=pi;
TOL=0.5e-6; %精确到小数点后6位

x=Bisection(f,a,b,TOL)

fsolve(f,(a+b)/2)