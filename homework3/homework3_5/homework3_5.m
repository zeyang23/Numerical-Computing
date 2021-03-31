clear all
clc

addpath(genpath('.'));

syms x
f=-log((cos(x)).^2)+x.^6-2*x.^4-x.^3-1;
d_f=diff(f);
xlim=[-2 2];
fplot(f,xlim)
hold on
fplot(0,xlim)
xticks(-2:0.25:2)
hold off

f=matlabFunction(f);
d_f=matlabFunction(d_f);

time=zeros(3,1);

tic
x1_N=Newton(f,d_f,((-1)+(-0.75))/2);
x2_N=Newton(f,d_f,(1.25+1.5)/2);
time(1)=toc;

tic
x1_S=Secant(f,-1,-0.75);
x2_S=Secant(f,1.25,1.5);
time(2)=toc;

tic
x1_f=fzero(f,((-1)+(-0.75))/2);
x2_f=fzero(f,(1.25+1.5)/2);
time(3)=toc;

fprintf("Newton\n")
disp(x1_N)
disp(x2_N)

fprintf("Secant\n")
disp(x1_S)
disp(x2_S)

fprintf("fzero\n")
disp(x1_f)
disp(x2_f)

fprintf("time of three methods\n")
disp(time);

rmpath(genpath('.'));