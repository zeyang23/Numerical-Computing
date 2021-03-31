clear
clc

A=[3 1 2;
   6 3 4;
   3 1 5];

tic;
[L1,U1,P1]=lu(A);
t1=toc;

tic;
[L2,U2,P2]=my_lu(A);
t2=toc;

disp("built-in lu")
disp("solution")
disp("L")
disp(L1)
disp("U")
disp(U1)
disp("P")
disp(P1)
disp("time")
disp(t1)

disp("my_lu")
disp("solution")
disp("L")
disp(L2)
disp("U")
disp(U2)
disp("P")
disp(P2)
disp("time")
disp(t2)