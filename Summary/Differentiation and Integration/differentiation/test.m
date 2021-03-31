clear
clc

f=@(x) x*cos(x);
x = pi/3;

h = 1e-3;

n=3;
F = Richardson(f,x,h,n)