clear
clc

f=@(x) cos(x);
a=0;
b=pi;
TOL=0.5e-6; %��ȷ��С�����6λ

x=Bisection(f,a,b,TOL)

fsolve(f,(a+b)/2)