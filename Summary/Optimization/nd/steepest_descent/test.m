clear;
clc;

f = @(z) 100*(z(2)-z(1)^2)^2+(z(1)-1)^2;

grad = @(z) [400*(z(1)^2-z(2))*z(1)+2*(z(1)-1);
             200*(z(2)-z(1)^2)];

z0 = [2;2];
TOL = 0.0001;

[f_min,z,k] = Steepest_Descent(f,grad,z0,TOL);