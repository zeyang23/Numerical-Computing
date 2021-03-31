clear
clc

x=0.1:0.1:0.9;
y=[2.3201,2.6470,2.9707,3.2885,3.6008,3.9090,4.2147,4.5191,4.8232];

x=x';
y=y';
% 注意，列向量！！！

f=@(c) (c(1).*x+c(2).*x.^2.*exp(-c(3).*x)+c(4))-y;

% 按列生成雅可比矩阵
Jacob=@(c) [x, x.^2.*exp(-c(3).*x), -x.^3*c(2).*exp(-c(3).*x), ones(size(x))];

% levenberg_marquardt对初值高度敏感
c0=[3.4;-0.5;0.5;2]; 

TOL=1e-8;

csolve=levenberg_marquardt(f,Jacob,c0,TOL)

lsqnonlin(f,c0)