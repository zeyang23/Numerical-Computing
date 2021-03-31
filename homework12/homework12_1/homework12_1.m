clear
clc

A=[2 -2 -1;
   4 1  -2;
   -2 1 -1];

% A=randi(3,3);
b=[-2;1;-3];

tic
x2=A\b;
t2=toc;

tic;
x1=gauss(A,b);
t1=toc;

e=norm(x1-x2);

disp("my_gauss")
disp("solution")
disp(x1)
disp("time")
disp(t1)

disp("A\b")
disp("solution")
disp(x2)
disp("time")
disp(t2)