clear all
clc

addpath(genpath('.'));

% f=@(x1,x2,a,b) [a*x1.^2-20*x1+b*x2.^2+8 0.5*x1.*x2.^2+2*x1-5*x2+8];
f10=@(x1,x2,a,b) a*x1.^2-20*x1+b*x2.^2+8; % 含参数a和b的函数

f2=@(x1,x2) 0.5*x1.*x2.^2+2*x1-5*x2+8; 

% 设定a和b的值；如果需要修改a和b的值，只需在此处修改
a=4; 
b=1/4;

f1=@(x1,x2) f10(x1,x2,a,b); % 根据a和b的取值更新函数f1

[X1,X2]=meshgrid((-3:0.01:3));
Z1=f1(X1,X2);
contour(X1,X2,Z1,'ShowText','on')
hold on
Z2=f2(X1,X2);
contour(X1,X2,Z2,'ShowText','on')
hold off
xlabel('x1')
ylabel('x2')
title('等值线图')

% 设定迭代初值；如果需要修改迭代初值，只需在此处修改
x10=0;
x20=0;

x=Newton_2d(f1,f2,x10,x20);
disp(x)

rmpath(genpath('.'));