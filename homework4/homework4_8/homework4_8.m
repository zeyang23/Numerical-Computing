clear
clc
addpath(genpath('.'));
format long
f=@(x) x-exp(-x);
x_f=fzero(f,0);
x_n=Newton(f,0,1e-5);
e=norm(x_n-x_f);
fprintf("求解方程结果如下，依次为 fzero结果 Newton结果 误差\n")
disp(x_f)
disp(x_n)
disp(e)

x=[0.3 0.4 0.5 0.6];
y=x-[0.740818 0.670320 0.606531 0.548812];

x_L=Lagrange_1(y,x,0);
x_P=pchip(y,x,0);
x_S=Spline_nature(y,x,0);
e_L=norm(x_L-x_f);
e_P=norm(x_P-x_f);
e_S=norm(x_S-x_f);

fprintf("反插值计算结果展示：\n")
fprintf("拉格朗日插值的结果和误差：\n")
disp(x_L)
disp(e_L)
fprintf("pchip插值的结果和误差：\n")
disp(x_P)
disp(e_P)
fprintf("自然样条插值的结果和误差：\n")
disp(x_S)
disp(e_S)

format
rmpath(genpath('.'));