clear
clc

f=@(t,y) 2./t.*y+t.^2*exp(t);

span=[1,2];
y0=0;
h=0.02;

[t,y]=Im_Trapezoid(f,span,y0,h);

plot(t,y)