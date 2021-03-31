clear
clc
addpath(genpath('.'));
x=[1 4 9 16];
y=[1 2 3 4];
dy_1=1/2;
dy_n=1/8;
u=linspace(0.5,16.5,1000);
v=Spline_specific(x,y,dy_1,dy_n,u);
plot(x,y,'o',u,v)
rmpath(genpath('.'));