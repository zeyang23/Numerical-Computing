clear all
clc

f=@(x) 5*sin(x)+10*cos(2*x);
x=rand(24,1);
y=f(x)-0.5+rand;
save("data.mat",'x','y');