clear
clc
addpath(genpath('.'));
load('2_t.mat')
load('2_y.mat')

A=[ones(25,1),t];
b=y;
c=(transpose(A)*A)\(transpose(A)*b);
fprintf("c1 c2�ֱ�Ϊ\n")
disp(c')
f=@(t) c(1)+c(2).*t;
u=linspace(1,25,1000);
v=f(u);
figure
plot(t,y,'o',u,v)
xlabel('t')
ylabel('y')
title('���Ч��ͼ')
legend('raw data','linear fit')
figure
r=f(t)-y;
plot(t,r,'--','Marker','o')
xlabel('t')
ylabel('�в�')
title('�в�ͼ')
rmpath(genpath('.'));