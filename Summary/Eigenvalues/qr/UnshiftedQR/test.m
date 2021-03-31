clear
clc

A=[3 1 0;
   1 3 1;
   0 1 3];

k=100;
[lam,Qbar]=UnshiftedQR(A,k)

[V,D] = eig(A)