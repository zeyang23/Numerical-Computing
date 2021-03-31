clear
clc

L=2;
a=0;b=L;
h=0.05;

ts=0;te=1;
k=0.05;

D=4;

f=@(x) (sin(pi/2*x)).^2;
left=@(t) 0;
right=@(t) 0;

C1=8;
[t1,x1,w1]=diffusion_cn(a,b,h,ts,te,k,D,C1,f,left,right);

mesh(t1,x1,w1)
xlabel('t')
ylabel('x')
zlabel('u(x,t)')
title('h=0.05 k=0.05 C=8')

C2=9;
[t2,x2,w2]=diffusion_cn(a,b,h,ts,te,k,D,C2,f,left,right);
figure
mesh(t2,x2,w2)
xlabel('t')
ylabel('x')
zlabel('u(x,t)')
title('h=0.05 k=0.05 C=9')

C3=10;
[t3,x3,w3]=diffusion_cn(a,b,h,ts,te,k,D,C3,f,left,right);
figure
mesh(t3,x3,w3)
xlabel('t')
ylabel('x')
zlabel('u(x,t)')
title('h=0.05 k=0.05 C=10')