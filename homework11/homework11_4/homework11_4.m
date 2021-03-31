clear
clc

f=@(t) exp(t);
u=linspace(0,1,10001);
V=f(u);

figure
n1=8;
t1=(0:n1-1)/n1;
f1=f(t1);
v1=DFT_Interpolation(t1,f1,u);
plot(u,v1)
xlabel('t');
ylabel('y');
title('DFT Interpolation n=8');
hold on
plot(u,V)
plot(t1,f1,'*')
legend('插值曲线','原曲线','数据点','Location','NorthWest')

figure
n2=16;
t2=(0:n2-1)/n2;
f2=f(t2);
v2=DFT_Interpolation(t2,f2,u);
plot(u,v2)
xlabel('t');
ylabel('y');
title('DFT Interpolation n=16');
hold on
plot(u,V)
plot(t2,f2,'*')
legend('插值曲线','原曲线','数据点','Location','NorthWest')

figure
n3=32;
t3=(0:n3-1)/n3;
f3=f(t3);
v3=DFT_Interpolation(t3,f3,u);
plot(u,v3)
xlabel('t');
ylabel('y');
title('DFT Interpolation n=8');
hold on
plot(u,V)
plot(t3,f3,'*')
legend('插值曲线','原曲线','数据点','Location','NorthWest')

figure
hold on
plot(u,v1)
plot(u,v2)
plot(u,v3)
plot(u,V)
legend('n=8','n=16','n=32','原曲线','Location','NorthWest')
xlabel('t');
ylabel('y');
title('DFT Interpolation');