clear
clc

f = @(x) x./(x.^2+4);

lb = 0;
ub = 1;
n = 10;
I = Lagrange_Interpolation(f,lb,ub,n);
format long
disp(I);
fprintf('Îó²î')
error=I-integral(f,0,1);
disp(error)