clear
clc

A=[4 2 0;
   4 4 2;
   2 2 3];

b=[2;4;6];

[L,U]=my_LU(A);

c=gauss(L,b);

x=gauss(U,c)

