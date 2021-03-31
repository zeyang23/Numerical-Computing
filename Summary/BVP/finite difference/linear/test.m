clear
clc

k1=-4;
k2=4;
k3=0;

a=0;
b=1;

ya=0;
yb=2;
h=0.05;

[t,y]=fdm_linear(k1,k2,k3,a,b,ya,yb,h);

plot(t,y)