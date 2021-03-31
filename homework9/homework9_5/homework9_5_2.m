clear
clc

a=0;b=1;
ts=0;te=1;

c=2;

f=@(x) zeros(size(x));
g=@(x) 2*pi*sin(pi*x);
left=@(t) 0;
right=@(t) 0;

u=@(x,t) sin(pi*x)*sin(2*pi*t);

h_value=zeros(5,1);
k_value=zeros(5,1);
accurate_value=u(0.25,0.75)*ones(5,1);
calculated_value=zeros(5,1);
error=zeros(5,1);


for i=1:5
    h=2^(-(i+3));
    k=h/c;
    h_value(i)=h;
    k_value(i)=k;
    [t,x,w]=wave(a,b,h,ts,te,k,c,f,g,left,right);
    calculated=w(x==0.25,t==0.75);
    calculated_value(i)=calculated;
    error(i)=calculated-accurate_value(i);
end

format long
table(k_value,h_value,accurate_value,calculated_value,error)