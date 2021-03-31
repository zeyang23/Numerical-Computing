clear;
clc;

figure;
hold on;

f = @(x,y) 100*(y-x^2)^2+(x-1)^2;
TOL = 0.0001;

u = 0:0.1:2;
v = 0:0.1:2;
[X,Y] = meshgrid(u,v);
Z = 100*(Y-X.^2).^2+(X-1).^2;
mesh(X,Y,Z);
view(-40,60);
grid on;
xlabel('x','FontSize',16);
ylabel('y','FontSize',16);
zlabel('z','FontSize',16);

% Steepest Descent
grad_x = @(x,y) 400*(x^2-y)*x+2*(x-1);
grad_y = @(x,y) 200*(y-x^2);
epsilon = 0.2;
z0 = [2;2];
[f_min_sd,zz_sd,k1] = Steepest_Descent(f,grad_x,grad_y,z0,TOL);
fprintf("Steepest_Descent\n");
fprintf("迭代次数 %d\n", k1);
fprintf("最优值 %0.6f \n", f_min_sd);
fprintf("最优解 \n ")
disp(zz_sd)

% Unconstrained Newton 
H_xx = @(x,y) 400*(3*x^2-y)+2;
H_xy = @(x,y) -400*x;
H_yx = @(x,y) -400*x;
H_yy = @(x,y) 200;
[f_min_un,zz_un,k2] = Unconstrained_Newton_Optimization(f,grad_x,grad_y,H_xx,H_xy,H_yx,H_yy,z0,TOL);
fprintf("Unconstrained_Newton_Optimization\n");
fprintf("迭代次数 %d\n", k2);
fprintf("最优值 %0.6f \n", f_min_un);
fprintf("最优解 \n ")
disp(zz_un)

% Unconstrained Quasi Newton
% f1=@(x) 100*(x(2)-x(1)^2)^2+(x(1)-1)^2;
[f_min_uqn,zz_uqn,k3] = Unconstrained_Quasi_Newton_Optimization(f,grad_x,grad_y,z0,TOL); 
fprintf("Unconstrained_Quasi_Newton_Optimization\n");
fprintf("迭代次数 %d\n", k3);
fprintf("最优值 %0.6f \n", f_min_uqn);
fprintf("最优解 \n ")
disp(zz_uqn)

% fminsearch
fun = @(x)100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;
x0 = [2,2];
[x,fval,~,output] = fminsearch(fun,x0);
fprintf("fminsearch\n");
fprintf("迭代次数 %d\n", output.iterations);
fprintf("最优值 %0.6f \n", fval);
fprintf("最优解 \n ")
disp(x)