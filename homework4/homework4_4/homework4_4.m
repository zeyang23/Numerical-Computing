clear
clc
addpath(genpath('.'));
x=linspace(-1,1,15);
f=@(x) 1./(25*x.^2+1);
y=f(x);
u1=linspace(-1,1,1000);
v1=Lagrange_1(x,y,u1);
figure
plot(u1,f(u1),u1,v1)
xlabel('x')
ylabel('y')
title('对比')
legend('f(x)','Lagrange')

n=1:15;
x_che=cos((2*n-1)/(2*length(n))*pi);
y_che=f(x_che);
u2=u1;
v2=Lagrange_1(x_che,y_che,u2);
figure
plot(u1,v1,u2,v2)
xlabel('x')
ylabel('y')
title('对比')
legend('均匀点集','切比雪夫点集')

rmpath(genpath('.'));