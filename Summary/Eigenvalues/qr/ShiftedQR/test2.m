clear
clc

A=[0 0 0 1;
   0 0 -1 0;
   0 1 0 0;
   -1 0 0 0];

[a,~]=hessen(A);

ShiftedQR(a)