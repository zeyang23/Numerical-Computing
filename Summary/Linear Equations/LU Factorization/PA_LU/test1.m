clear
clc

A=[3 1 2;
   6 3 4;
   3 1 5];

[L1,U1,P1]=my_PA_LU(A)

[L2,U2,P2]=lu(A)