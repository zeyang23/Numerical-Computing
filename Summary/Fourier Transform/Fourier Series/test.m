clear all
clc

syms x;

xs=-pi;
xe=pi;

T=xe-xs;
omega=2*pi/T;

f=symfun(x^2,x);

a0=double(2/T*int(f,x,xs,xe));

N=5;
for i=1:N
    a(i)=double(2/T*int(f*cos(i*omega*x),x,xs,xe));
    b(i)=double(2/T*int(f*sin(i*omega*x),x,xs,xe));
end

u=linspace(-pi,pi,1001);
v=a0/2;

for i=1:N
    v=v+a(i)*cos(i*omega*u)+b(i)*sin(i*omega*u);
end
plot(u,v)

V=u.^2;
hold on
plot(u,V)
legend('傅里叶展开','原函数')
xlabel('x');
ylabel('y');
title('y = x^2');