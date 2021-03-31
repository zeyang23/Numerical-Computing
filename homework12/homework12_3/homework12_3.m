clear
clc

A=[2 -1 0 0 0;
   1 2 -1 0 0;
   0 1 2 -1 0;
   0 0 1 2 -1;
   0 0 0 1 2];

b=[1;0;0;0;0];

x1=chase(A,b);
x2=A\b;

e=norm(x1-x2); 
disp(x1)