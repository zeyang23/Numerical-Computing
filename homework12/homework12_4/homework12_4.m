clear
clc

A=[3 -1 0 0 0 1/2;
   -1 3 -1 0 1/2 0;
   0 -1 3 -1 0 0;
   0 0 -1 3 -1 0;
   0 1/2 0 -1 3 -1;
   1/2 0 0 0 -1 3];
b=[5/2;3/2;1;1;3/2;5/2];

x0=zeros(size(b));
TOL=1e-3;
xf=[1;1;1;1;1;1];
tic;
[x1,k1]=jacobi(A,b,x0,xf,TOL);
t1=toc;
tic;
[x2,k2]=gauss_seidel(A,b,x0,xf,TOL);
t2=toc;

disp("jacobi")
disp("solution")
disp(x1)
disp("time")
disp(t1)
disp("iterations")
disp(k1)

disp("gauss_seidel")
disp("solution")
disp(x2)
disp("time")
disp(t2)
disp("iterations")
disp(k2)