clear
clc

f=@(x) x./log(1+x);
lb=1;
ub=2;
m1=5;
m2=10;

I_t1=Composite_Trapezoid(f,lb,ub,m1)
I_s1=Composite_Simpson(f,lb,ub,m1)

I_t2=Composite_Trapezoid(f,lb,ub,m2)
I_s2=Composite_Simpson(f,lb,ub,m2)

syms t
y = t/(log(1+t));
I_int = double(int(y,[lb,ub]))

I_quad = quad(f,lb,ub)

m=10;
I_mid=Composite_Midpoint(f,0,2,m)