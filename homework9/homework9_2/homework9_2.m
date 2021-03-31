clear
clc

a=0;b=1;
h=0.1;

ts=0;te=1;
k1=0.02;

D=1/pi;

f=@(x) cos(pi*x);
left=@(t) exp(-pi*t);
right=@(t) -exp(-pi*t);

[t1,x1,w1]=heat_bd(a,b,h,ts,te,k1,D,f,left,right);

mesh(t1,x1,w1)
xlabel('t')
ylabel('x')
zlabel('u(x,t)')
title('h=0.1 k=0.02')

k2=0.01;
[~,~,w2]=heat_bd(a,b,h,ts,te,k2,D,f,left,right);

k3=0.005;
[~,~,w3]=heat_bd(a,b,h,ts,te,k3,D,f,left,right);

u=@(x,t) exp(-pi*t).*cos(pi*x);
y=u(0.3,1);
e1=w1(4,end)-y;
e2=w2(4,end)-y;
e3=w3(4,end)-y;

time_step=[k1;k2;k3];
accurate_value=[y;y;y];
calculated_value=[w1(4,end);w2(4,end);w3(4,end)];
error=[e1;e2;e3];
format long
table(time_step,accurate_value,calculated_value,error)