clear
clc

t=(0:7)/8;
y=[1 0 -2 1 3 0 -2 1];

u=linspace(0,1,1001);

v = DFT_Least_Squares (t,y,u,8);

hold on
plot(t,y,'*')
plot(u,v)