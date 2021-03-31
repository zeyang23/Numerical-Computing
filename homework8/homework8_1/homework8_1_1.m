clear
clc

u=linspace(-20,20);
for k=1:length(u)
    v(k)=Fun(u(k));
end
plot(u,v)
hold on
plot(u,zeros(length(u)),'--','Color','r')
hold off
xlabel('初始一阶导 s')
ylabel('F(s)')
title('选取初值的依据')

a1=-5;
b1=-4;
TOL=0.5e-6;
s1=Bisection(@Fun,a1,b1,TOL);

a2=-1;
b2=1;
s2=Bisection(@Fun,a2,b2,TOL);

f=@(t,y) [y(2);2*exp(-2*y(1)).*(1-t.^2)];
y1_0=[0;s1];
h=0.01;
t=0:h:1; 
y1(:,1)=y1_0;
for i=1:length(t)-1
    y1(:,i+1)=y1(:,i)+h*f(t(i),y1(:,i));
end

y2_0=[0;s2];
y2(:,1)=y2_0;
for i=1:length(t)-1
    y2(:,i+1)=y2(:,i)+h*f(t(i),y2(:,i));
end

figure
hold on
plot(t,y1(1,:))
plot(t,y2(1,:))
xlabel('t')
ylabel('y')
title('solution')
Legend1=['s1 = ',num2str(s1)];
Legend2=['s2 = ',num2str(s2)];
legend(Legend1,Legend2)

function r=Fun(s)
    f=@(t,y) [y(2);2*exp(-2*y(1)).*(1-t.^2)];
    y0=[0;s];
    h=0.01;
    t=0:h:1; 
    y(:,1)=y0;
    for i=1:length(t)-1
        y(:,i+1)=y(:,i)+h*f(t(i),y(:,i));
    end
    r=y(1,end)-log(2);
end

function x=Bisection(f,a,b,TOL) 
    % f是函数句柄，最好是匿名函数
    % a是区间左端，b是区间右端
    % TOL=0.5e-p 精确到小数点后p位
    
    % 检验a和b是否满足条件
    if(sign(f(a))==sign(f(b)))
        error('wrong input');
    end
    
    while (b-a)/2 > TOL
        c=(a+b)/2;
        fc=f(c);
        if(fc==0)
            break;
        end
        if sign(fc)==sign(f(b))
            b=c;
        else
            a=c;
        end
    end
    x=(a+b)/2;
end