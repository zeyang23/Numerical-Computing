clear all
clc

addpath(genpath('.'));

% f=@(x1,x2,a,b) [a*x1.^2-20*x1+b*x2.^2+8 0.5*x1.*x2.^2+2*x1-5*x2+8];
f10=@(x1,x2,a,b) a*x1.^2-20*x1+b*x2.^2+8; % ������a��b�ĺ���

f2=@(x1,x2) 0.5*x1.*x2.^2+2*x1-5*x2+8; 

% �趨a��b��ֵ�������Ҫ�޸�a��b��ֵ��ֻ���ڴ˴��޸�
a=4; 
b=1/4;

f1=@(x1,x2) f10(x1,x2,a,b); % ����a��b��ȡֵ���º���f1

[X1,X2]=meshgrid((-3:0.01:3));
Z1=f1(X1,X2);
contour(X1,X2,Z1,'ShowText','on')
hold on
Z2=f2(X1,X2);
contour(X1,X2,Z2,'ShowText','on')
hold off
xlabel('x1')
ylabel('x2')
title('��ֵ��ͼ')

% �趨������ֵ�������Ҫ�޸ĵ�����ֵ��ֻ���ڴ˴��޸�
x10=0;
x20=0;

x=Newton_2d(f1,f2,x10,x20);
disp(x)

rmpath(genpath('.'));