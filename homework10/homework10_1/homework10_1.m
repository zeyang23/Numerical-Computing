clear;
clc;

f = @(x) 3*x.^4+4*x.^3-12*x.^2+5;
TOL = 0.0001;
a = -3;
b = 2;
u=linspace(a,b);
v=f(u);
plot(u,v)
xlabel('x')
ylabel('f(x)')
title('选取区间的依据')

% Golden Section Search
tic;
[f_min_gss,xx_gss,n_gss] = Golden_Section_Search(f,-2.5,-1.5,TOL);
t1=toc;

fprintf("Golden Section Search\n");
fprintf("最优解 %0.6f\n", xx_gss);
fprintf("最优值 %0.6f\n", f_min_gss);
fprintf("迭代次数 %d\n", n_gss);
fprintf("执行时间 %d\n\n", t1);

% Newton Optimization
x0 = -1.5;
df1 = @(x) 12*x^3+12*x^2-24*x;
df2 = @(x) 36*x^2+24*x-24;

tic;
[f_min_n,xx_n,n_n] = Newton_Optimization(f,df1,df2,x0,TOL);
t2=toc;
fprintf("Newton Optimization\n");
fprintf("最优解 %0.6f\n", xx_n);
fprintf("最优值 %0.6f\n", f_min_n);
fprintf("迭代次数 %d\n", n_n);
fprintf("执行时间 %d\n\n", t2);

% Quasi Newton Optimization
x0 = -1.5;
dx = 0.001;
tic;
[f_min_qn,xx_qn,n_qn] = Quasi_Newton_Optimization(f,x0,dx,TOL);
t3=toc;

fprintf("Quasi Newton Optimization\n");
fprintf("最优解 %0.6f\n", xx_qn);
fprintf("最优值 %0.6f\n", f_min_qn);
fprintf("迭代次数 %d\n", n_qn);
fprintf("执行时间 %d\n\n", t3);

% Inaccurate Line Search
alpha_0 = 0.5;
x0 = -3;
epsilon = 0.2;
grad = @(x) 12*x^3+12*x^2-24*x;
w = 0.5;
tic;
[f_min_ils,xx_ils,n_ils] = Inaccurate_Line_Search(f,grad,epsilon,w,alpha_0,x0,TOL);
t4=toc;

fprintf("Inaccurate Line Search\n");
fprintf("最优解 %0.6f\n", xx_ils);
fprintf("最优值 %0.6f\n", f_min_ils);
fprintf("迭代次数 %d\n", n_ils);
fprintf("执行时间 %d\n\n", t4);

% fminbnd
tic
[x,fval,~,output]=fminbnd(f,-2.5,-1.5);
t5=toc;
fprintf("fminbnd");
fprintf("最优解 %0.6f\n", x);
fprintf("最优值 %0.6f\n", fval);
fprintf("迭代次数 %d\n", output.iterations);
fprintf("执行时间 %d\n\n", t5);