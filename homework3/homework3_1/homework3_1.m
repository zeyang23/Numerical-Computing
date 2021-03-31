addpath(genpath('.'));
clear
clc

syms a b c x
p=a*x^3+b*x+c;
p=subs(p,{a,b,c},{0.5,-8,-4});
xs=solve(p==0,x); % 符号运算结果
xs=double(xs);    % 将符号运算结果转换为数值
xr=roots([0.5 0 -8 -4]); % roots求解结果

% 为了便于比较，将求解结果中的3个根从小到大排列
xs=sort(xs);
xr=sort(xr);
% e=norm(xs-xr); % 比较两种方法得到的结果

fprintf("符号求解\n")
disp(xs)
fprintf("roots求解\n")
disp(xr)
% fprintf("比较\n")
% disp(e)

f=@(x) 0.5*x.^3-8*x-4;

% 二分法
p=6;
TOL=0.5*10^(-p);
xb=zeros(3,1);

a1=-4; b1=-3;
xb(1)=Bisection(f,a1,b1,TOL);

a2=-1; b2=0;
xb(2)=Bisection(f,a2,b2,TOL);

a3=4; b3=5;
xb(3)=Bisection(f,a3,b3,TOL);

% fzero
xz=zeros(3,1);
xz(1)=fzero(f,-4);
xz(2)=fzero(f,-1);
xz(3)=fzero(f,4);

fprintf("二分法\n")
disp(xb)
fprintf("fzero\n")
disp(xz)

rmpath(genpath('.'));
