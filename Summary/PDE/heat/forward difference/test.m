clear
clc

h=0.1;
a=0;b=1;

ts=0;te=1;
k=0.002;

D=2;

left=@(t) 2*exp(2*t);
right=@(t) (exp(2)+1)*exp(2*t-1);

f=@(x) 2*cosh(x);

[t,x,w]=heat_fd(a,b,h,ts,te,k,D,f,left,right);

mesh(t,x,w)