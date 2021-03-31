clear all
clc

syms t y(t)
y=dsolve(diff(y,2)==4*(y-t),y(0)==0,y(1)==2);
pretty(y)
Y=matlabFunction(y);

u=linspace(0,1,10000);
v=Y(u);
plot(u,v)
hold on

h1=0.1;
t1=0:h1:1;
n1=length(t1)-2;
A1=zeros(n1);
A1(1,1)=-(4*h1^2+2);
A1(1,2)=1;
A1(n1,n1-1)=1;
A1(n1,n1)=-(4*h1^2+2);
b1=zeros(n1,1);
b1(1)=-4*h1^2*t1(2);
b1(end)=-4*h1^2*t1(end-1)-2;
for k=2:n1-1
    A1(k,k-1)=1;
    A1(k,k)=-(4*h1^2+2);
    A1(k,k+1)=1;
    b1(k)=-4*h1^2*t1(k+1);
end
y1=transpose(A1\b1);
y1=[0,y1,2];
plot(t1,y1,'*','MarkerSize',8)

h2=0.05;
t2=0:h2:1;
n2=length(t2)-2;
A2=zeros(n2);
A2(1,1)=-(4*h2^2+2);
A2(1,2)=1;
A2(n2,n2-1)=1;
A2(n2,n2)=-(4*h2^2+2);
b2=zeros(n2,1);
b2(1)=-4*h2^2*t2(2);
b2(end)=-4*h2^2*t2(end-1)-2;
for k=2:n2-1
    A2(k,k-1)=1;
    A2(k,k)=-(4*h2^2+2);
    A2(k,k+1)=1;
    b2(k)=-4*h2^2*t2(k+1);
end
y2=transpose(A2\b2);
y2=[0,y2,2];
plot(t2,y2,'+','MarkerSize',6)

h3=0.025;
t3=0:h3:1;
n3=length(t3)-2;
A3=zeros(n3);
A3(1,1)=-(4*h3^2+2);
A3(1,2)=1;
A3(n3,n3-1)=1;
A3(n3,n3)=-(4*h3^2+2);
b3=zeros(n3,1);
b3(1)=-4*h3^2*t3(2);
b3(end)=-4*h3^2*t3(end-1)-2;
for k=2:n3-1
    A3(k,k-1)=1;
    A3(k,k)=-(4*h3^2+2);
    A3(k,k+1)=1;
    b3(k)=-4*h3^2*t3(k+1);
end
y3=transpose(A3\b3);
y3=[0,y3,2];
plot(t3,y3,'o','MarkerSize',4)
hold off
legend('½âÎö½â','h=0.1','h=0.05','h=0.025','Location','northwest')
xlabel('t')
ylabel('y')
title('solution')

t=0.5;
a=y1(t1==t);
fa=4*(a-t);
b=y2(t2==t);
fb=4*(b-t);
c=y3(t3==t);
fc=4*(c-t);
f=(16*(4*fc-fb)/(2^2-1)-(4*fb-fa)/(2^2-1))/(2^4-1);
result=f/4+t;
fprintf('Richardson extrapolation Result\n')
format long
disp(result)
format