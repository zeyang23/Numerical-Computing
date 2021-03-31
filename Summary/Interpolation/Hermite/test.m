clear
clc

x=1:6;
y=[16,18,21,17,15,12];
dy=[1,0,0,0,0,1];
u=linspace(0.75,6.25,100);

v=Hermite(x,y,dy,u);

plot(u,v)
hold on
plot(x,y,'*')