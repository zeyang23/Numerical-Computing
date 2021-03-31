clear
clc

a=0;b=1;
h=0.05;

ts=0;te=1;
k=0.01;

c=2;

f=@(x) zeros(size(x));
g=@(x) 2*pi*sin(pi*x);
left=@(t) 0;
right=@(t) 0;

figure
[t,x,w]=wave(a,b,h,ts,te,k,c,f,g,left,right);
mesh(t,x,w)