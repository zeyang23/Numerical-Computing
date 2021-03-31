clear
clc
addpath(genpath('.'));

u=115;
% 线性插值
x1=[100 121];
y1=sqrt(x1);
v1=Lagrange_1(x1,y1,u);
e1=norm(v1-sqrt(u));
fprintf("线性插值的结果与误差：\n")
disp(v1)
disp(e1)

% 抛物线插值
x2=[100 121 144];
y2=sqrt(x2);
v2=Lagrange_1(x2,y2,u);
e2=norm(v2-sqrt(u));
fprintf("抛物线插值的结果与误差：\n")
disp(v2)
disp(e2)

rmpath(genpath('.'));