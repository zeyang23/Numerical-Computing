clear
clc

f=@(y) y.^2-y.^3;
df=@(y) 2*y-3*y.^2;
delta=1e-6;
h=0.1;
t=0:h:2/delta;
y(1)=delta;
TOL=1e-5;

tic
for k=1:length(t)-1
    % 隐式梯形法 执行时间较长
    p=[h/2,-h/2,1,-y(k)-h/2*f(y(k))];
    A=roots(p);
    B=A(imag(A)==0);
    y(k+1)=B(B>=0);
    
%   y(k+1)=y(k)+h/2*(f(y(k))+f(y(k)+h*f(y(k))));  % 显式梯形法
end
t1=toc;

plot(t,y,'-o','MarkerSize',2)
xlabel('t')
ylabel('y')
title('y=f(t) 隐式梯形')

tspan = [0 2/delta];
y0 = delta;

figure
tic
opts = odeset('AbsTol',1e-5);
[t_ode15s,y_ode15s] = ode15s(@(t,y) y.^2-y.^3, tspan, y0,opts);
t2=toc;
plot(t_ode15s,y_ode15s,'-o','MarkerSize',2)
xlabel('t')
ylabel('y')
title('y=f(t) ode15s')

figure
tic
opts = odeset('AbsTol',1e-5);
[t_ode45,y_ode45] = ode45(@(t,y) y.^2-y.^3, tspan, y0,opts);
t3=toc;
plot(t_ode45,y_ode45,'-*','MarkerSize',2)
xlabel('t')
ylabel('y')
title('y=f(t) ode45')

fprintf('隐式梯形用时\n')
disp(t1)
fprintf('ode15s用时\n')
disp(t2)
fprintf('ode45用时\n')
disp(t3)

figure
a=1/delta-1;
F=@(t) 1./(lambertw(0,a*exp(a-t))+1);
plot(t,F(t));