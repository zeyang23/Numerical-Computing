clear
clc

f=@(x) x.*sqrt(x.^2 + 1);
a=0;
b=3;
TOL=1e-5;

[I,R] = Romberg_Integration(f,a,b,TOL);

n=6;
r=romberg(f,a,b,n);

fprintf('Integration')
disp(I)
fprintf('Romberg table\n')
disp(R)