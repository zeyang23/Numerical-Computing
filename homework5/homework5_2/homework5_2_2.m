clear
clc
addpath(genpath('.'));
load('2_t.mat')
load('2_y.mat')

t1=t;
y1=y;
t1(7)=[];
y1(7)=[];
A1=[ones(24,1),t1,sin(t1)];
b=y1;
c=(transpose(A1)*A1)\(transpose(A1)*b);
fprintf("c1 c2 c3分别为\n")
disp(c')
f=@(t) c(1)+c(2).*t+c(3).*sin(t);
u=linspace(1,25,1000);
v=f(u);
figure
plot(t1,y1,'o',u,v)
hold on
plot(t(7),y(7),'*')
xlabel('t')
ylabel('y')
title('拟合效果图')
hold off
legend('raw data','linear fit','离群点')
figure
r1=f(t1)-y1;
plot(t1,r1,'--','Marker','o')
hold on
plot(t(7),f(t(7))-y(7),'*')
hold off
xlabel('t')
ylabel('残差')
title('残差图')
legend('数据点','离群点')
rmpath(genpath('.'));