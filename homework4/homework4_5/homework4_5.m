clear
clc
addpath(genpath('.'));
x=[0 1 2 3 4 5];
y=[3 1 4 1 2 0];
u=linspace(-0.5,5.5,1000);
v=Spline_nature(x,y,u);
plot(x,y,'o',u,v)
title('Spline nature')
xlabel('x')
ylabel('y')
rmpath(genpath('.'));