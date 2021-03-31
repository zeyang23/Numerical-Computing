clear
clc

f=@(x) x./log(1+x);
a=1;
b=2;

m=10;

I=Composite_Trapezoid(f,a,b,m)