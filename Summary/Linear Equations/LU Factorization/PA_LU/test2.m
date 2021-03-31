clear
clc

A=[4 2 0;
   4 4 2;
   2 2 3];

b=[2;4;6];

[L,U,P]=my_PA_LU(A);

c=gauss(L,P*b);

x=gauss(U,c)

