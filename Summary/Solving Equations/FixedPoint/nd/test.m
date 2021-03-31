clear
clc

f=@(x) [sqrt(2*x(2)/5)-x(1); x(2)-0.25*(sin(x(1))+cos(x(2)))];

g=@(x) [sqrt(2*x(2)/5); 0.25*(sin(x(1))+cos(x(2)))];

x0=[0.2;0.2];

TOL=1e-6;

x=FixedPoint_nd(g,x0,TOL)

fsolve(f,x0)