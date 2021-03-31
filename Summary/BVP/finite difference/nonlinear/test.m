clear
clc

a=0;
b=1;
ya=1;
yb=4;

h=0.01;
t=a:h:b;

n=length(t)-2;

y0=transpose(linspace(ya,yb,n));
TOL=1e-5;

y=Newton_nd(@f,@Jacob,y0,TOL);
y=[ya;y;yb];

plot(t,y)

function r=f(y)
    ya=1;
    yb=4;
    h=0.01;
    
    r=zeros(size(y));
    
    r(1)=ya-(2+h^2)*y(1)+h^2*y(1)^2+y(2);
    r(end)=y(end-1)-(2+h^2)*y(end)+h^2*y(end)^2+yb;
    
    for i=2:length(r)-1
        r(i)=y(i-1)-(2+h^2)*y(i)+h^2*y(i)^2+y(i+1);
    end
end

function J=Jacob(y)
    h=0.01;

    v1=ones(length(y)-1,1);
    v2=2*h^2.*y-(2+h^2);
    v3=v1;
    
    J=diag(v1,1)+diag(v2)+diag(v3,-1);
end