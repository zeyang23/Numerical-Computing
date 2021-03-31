clear
clc
addpath(genpath('.'));

f = @(x) (fsolve((@(y) x+exp(y)+(x.^2).*y-4),x));
x=linspace(-3,3,1000);
y=f(x);
plot(x,y)
xlim([-3 3])
xticks(-3:0.5:3)
xlabel('x')
ylabel('y')
title('y=f(x)')
grid on
axis equal

a=2.5; b=3.5;
p=6; TOL=0.5*10^(-p);

x0=Bisection(f,a,b,TOL);
disp(x0)
rmpath(genpath('.'));