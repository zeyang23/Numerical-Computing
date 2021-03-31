clear
clc

f=@(t,y) (1+t)./(1+y);
span=[1,2];
y0=2;
h=0.1;
[t,y]=Euler(f,span,y0,h);
plot(t,y)