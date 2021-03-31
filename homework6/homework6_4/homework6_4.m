clear
clc

f=@(x) x.*sqrt(x.^2 + 1);
[I,R] = Romberg_Integration(f,0,3,1e-5);

fprintf('Integration')
disp(I)
fprintf('Romberg table\n')
disp(R)