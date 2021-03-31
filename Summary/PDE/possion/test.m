clear
clc

xl=0;xr=1;
h=0.1;

yl=0;yh=1;
k=0.1;

f=@(x,y) exp(-x.*y).*(x.^2+y.^2);
g1=@(x) ones(size(x));
g2=@(x) exp(-x);
g3=@(y) ones(size(y));
g4=@(y) exp(-y);


[x,y,w]=poisson(xl,xr,h,yl,yh,k,f,g1,g2,g3,g4);
mesh(x,y,w)