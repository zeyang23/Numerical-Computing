clear
clc

x0=9;
% ��ʼ����f(x)
f=@(x) x^2-x0; 

% ���ݳ�ʼ��������g(x)
g=@(x) 1/2*(x+x0./x);
TOL=1e-6;

x=FixedPoint(g,x0,TOL)

fsolve(f,x0)