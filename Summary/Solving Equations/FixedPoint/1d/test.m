clear
clc

x0=9;
% 初始函数f(x)
f=@(x) x^2-x0; 

% 根据初始函数构造g(x)
g=@(x) 1/2*(x+x0./x);
TOL=1e-6;

x=FixedPoint(g,x0,TOL)

fsolve(f,x0)