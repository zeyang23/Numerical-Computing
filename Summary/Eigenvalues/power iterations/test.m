clear
clc

A=[1,3;2,2];

x0 = [-5;5]; 
k = 10;

[lam1,u1] = PowerIteration(A,x0,k)

s=3;
[lam2,u2] = InversePowerIteration(A,x0,s,k)