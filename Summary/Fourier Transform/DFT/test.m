clear
clc

x=transpose([0,1,0,-1,0,1,0,-1]);
[y_D,F_D] = DFT(x);

u=[1;-1i;1;1i];
[iy,IF] = Inverse_DFT(u);