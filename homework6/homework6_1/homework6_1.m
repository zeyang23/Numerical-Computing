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

% 三点差分
d_f_2 = @(x,h) (f(x+h)-2*f(x)+f(x-h))./(h.^2); 

% 得到计算结果
d_f_2_result = d_f_2(x,h);
error=d_f_2_result-df2(x);

OUTPUT = [h;d_f_2_result;error];
file=fopen('table.txt','w');
fprintf(file,'%6s %20s %14s\n','h','导数计算值','误差');
fprintf(file,'%.10f %20.12f %20.12f\n',OUTPUT);
fclose(file);


loglog(h,abs(error),'o','MarkerSize',4,'MarkerFaceColor','black');

grid on
title('误差随h变化图');
xlabel('h');
ylabel('误差');

% 第2问
format long
H = 1e-3;
Q2 = (4*d_f_2(x,H/2)-d_f_2(x,H))/3;
fprintf('Richardson\n')
disp(Q2)

% 第3问
% df是函数的一阶导数，将二阶导数的三点差分外推后可以得到二阶导数的五点差分公式

H1=1e-3;
df3=(-df(x-H1)+16*df(x-H1/2)-30*df(x)+16*df(x+H1/2)-df(x+H1))/(3*H1.^2);

fprintf('five-point centered\n');
disp(df3)