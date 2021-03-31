clear
clc

% 第1问
h=0.1;
a=0;b=1;

ts=0;te=1;
k1=2e-3;

D=2;
left=@(t) 2*exp(2*t);
right=@(t) (exp(2)+1)*exp(2*t-1);
f=@(x) 2*cosh(x);

[t1,x1,w1]=heat_fd(a,b,h,ts,te,k1,D,f,left,right);

mesh(t1,x1,w1)
xlabel('t')
ylabel('x')
zlabel('u(x,t)')
title('h=0.1 k=0.002')

% 第2问
k2=4e-3;
[t2,x2,w2]=heat_fd(a,b,h,ts,te,k2,D,f,left,right);

figure
mesh(t2,x2,w2)
xlabel('t')
ylabel('x')
zlabel('u(x,t)')
title('h=0.1 k=0.004')