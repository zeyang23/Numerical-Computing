clear
clc

a=0;b=1;
h=0.05;

ts=0;te=1;
k1=0.01;

c=2;

f=@(x) zeros(size(x));
g=@(x) 2*pi*sin(pi*x);
left=@(t) 0;
right=@(t) 0;

[t1,x1,w1]=wave(a,b,h,ts,te,k1,c,f,g,left,right);
mesh(t1,x1,w1)
xlabel('t')
ylabel('x')
zlabel('u(x,t)')
title('h=0.05 k=0.01')