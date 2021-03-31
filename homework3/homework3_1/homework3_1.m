addpath(genpath('.'));
clear
clc

syms a b c x
p=a*x^3+b*x+c;
p=subs(p,{a,b,c},{0.5,-8,-4});
xs=solve(p==0,x); % ����������
xs=double(xs);    % ������������ת��Ϊ��ֵ
xr=roots([0.5 0 -8 -4]); % roots�����

% Ϊ�˱��ڱȽϣ���������е�3������С��������
xs=sort(xs);
xr=sort(xr);
% e=norm(xs-xr); % �Ƚ����ַ����õ��Ľ��

fprintf("�������\n")
disp(xs)
fprintf("roots���\n")
disp(xr)
% fprintf("�Ƚ�\n")
% disp(e)

f=@(x) 0.5*x.^3-8*x-4;

% ���ַ�
p=6;
TOL=0.5*10^(-p);
xb=zeros(3,1);

a1=-4; b1=-3;
xb(1)=Bisection(f,a1,b1,TOL);

a2=-1; b2=0;
xb(2)=Bisection(f,a2,b2,TOL);

a3=4; b3=5;
xb(3)=Bisection(f,a3,b3,TOL);

% fzero
xz=zeros(3,1);
xz(1)=fzero(f,-4);
xz(2)=fzero(f,-1);
xz(3)=fzero(f,4);

fprintf("���ַ�\n")
disp(xb)
fprintf("fzero\n")
disp(xz)

rmpath(genpath('.'));
