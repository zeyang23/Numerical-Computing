clear
clc
addpath(genpath('.'));
x=[1 2 3 4 5 6];
y=[10 6 8 12 10 6];
dy=[1 0.3 0.5 0.2 -0.5 1];
u=linspace(0.5,6.5,1000);
v_h=Hermite(x,y,dy,u);
v_p=pchip(x,y,u);
plot(x,y,'o',u,v_h,'r',u,v_p,'b')
legend('raw data','hermite','pchip')
rmpath(genpath('.'));