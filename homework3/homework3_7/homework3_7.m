clear all
clc

addpath(genpath('.'));

syms x;
f=x^3-x-1;
d_f=diff(f);

f=matlabFunction(f);
d_f=matlabFunction(d_f);

x0=0.6;

xn=Newton(f,d_f,x0);
xd=Downhill(f,d_f,x0);

fprintf("Newton\n")
disp(xn(end))
fprintf("Downhill\n")
disp(xd(end))

figure
plot(xn,'Marker','o')

figure
plot(xd,'Marker','o')

rmpath(genpath('.'));