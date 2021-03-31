clear
clc

x=[-1,-0.5,0,0.5,1]; 
y=exp(x);

u=linspace(-3,2,20); 
v=Lagrange_1(x,y,u);
% v=Lagrange_2(x,y,u);

plot(u,v)
hold on
plot(x,y,'*')