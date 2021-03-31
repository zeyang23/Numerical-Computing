clear
clc

f=@(t) exp(t);
n=8;
t=(0:n-1)/n;
y=f(t);

u=linspace(0,1,1001);
v=DFT_Interpolation(t,y,u);
% v=DFT_Inter(t,y,u);

plot(u,v)
xlabel('t');
ylabel('y');
title('DFT Interpolation n=8');


U=u;
V=f(u);
hold on
plot(U,V)
plot(t,y,'*')
legend('插值曲线','原曲线','数据点','Location','NorthWest')