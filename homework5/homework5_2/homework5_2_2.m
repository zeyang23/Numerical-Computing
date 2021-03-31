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
fprintf("c1 c2 c3�ֱ�Ϊ\n")
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
title('���Ч��ͼ')
hold off
legend('raw data','linear fit','��Ⱥ��')
figure
r1=f(t1)-y1;
plot(t1,r1,'--','Marker','o')
hold on
plot(t(7),f(t(7))-y(7),'*')
hold off
xlabel('t')
ylabel('�в�')
title('�в�ͼ')
legend('���ݵ�','��Ⱥ��')
rmpath(genpath('.'));