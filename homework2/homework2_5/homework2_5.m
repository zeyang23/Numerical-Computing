addpath(genpath('.'));
clear all;
clc;
A=magic(6);
disp(A)
for i=1:numel(A)
    A(i)=A(i)*isprime(A(i));
end
disp(A)

rmpath(genpath('.'));