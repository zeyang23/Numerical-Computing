clear
clc

syms t
f = @(t) t.*cos(t); 
df = matlabFunction((diff(f,t,1))); 
df2 = matlabFunction((diff(f,t,2))); 

x = pi/3;

for ii = 1:10
    h(1,ii) = 10^(-1*ii);
end 

% ������
d_f_2 = @(x,h) (f(x+h)-2*f(x)+f(x-h))./(h.^2); 

% �õ�������
d_f_2_result = d_f_2(x,h);
error=d_f_2_result-df2(x);

OUTPUT = [h;d_f_2_result;error];
file=fopen('table.txt','w');
fprintf(file,'%6s %20s %14s\n','h','��������ֵ','���');
fprintf(file,'%.10f %20.12f %20.12f\n',OUTPUT);
fclose(file);


loglog(h,abs(error),'o','MarkerSize',4,'MarkerFaceColor','black');

grid on
title('�����h�仯ͼ');
xlabel('h');
ylabel('���');

% ��2��
format long
H = 1e-3;
Q2 = (4*d_f_2(x,H/2)-d_f_2(x,H))/3;
fprintf('Richardson\n')
disp(Q2)

% ��3��
% df�Ǻ�����һ�׵����������׵��������������ƺ���Եõ����׵���������ֹ�ʽ

H1=1e-3;
df3=(-df(x-H1)+16*df(x-H1/2)-30*df(x)+16*df(x+H1/2)-df(x+H1))/(3*H1.^2);

fprintf('five-point centered\n');
disp(df3)