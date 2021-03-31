clear all
clc

m=linspace(0,20);
for q=1:length(m)
    n(q)=Fun(m(q));
end
plot(m,n)
xlabel('c')
ylabel('f')
title('选定c的初值的依据')
hold on
plot(m,zeros(length(m)),'--','Color','r')
hold off

a=10;b=15;
TOL=0.5e-6;
c=Bisection(@Fun,a,b,TOL);
format long
disp(c)
format

h1=0.01;
t1=0:h1:1;
n1=length(t1)-2;
    
u1=linspace(0,1,n1);

y1(:,1)=u1;

k=1;
while(1)
    J=zeros(n1);
    J(1,1:2)=[-(2+c*h1^2)+2*c*h1^2*y1(1,k),1];
    J(n1,end-1:end)=[1,-(2+c*h1^2)+2*c*h1^2*y1(end,k)];
    for i=2:n1-1
        J(i,i-1:i+1)=[1,-(2+c*h1^2)+2*c*h1^2*y1(i,k),1];
    end
    delta=J\(-f(y1(:,k),h1,c));
    y1(:,k+1)=y1(:,k)+delta;
    k=k+1;
    if(norm(y1(:,k)-y1(:,k-1))<1e-6)
        break
    end
    if(k>=1e4)
        error('diverge')
    end
end
y1=[0,transpose(y1(:,end)),1];
figure
plot(t1,y1,'-*','MarkerIndice',[1,find(t1==0.5),length(t1)],'MarkerSize',8)
xlabel('t')
ylabel('y')
title('solution')

p=find(t1==0.5);
text(t1(p),y1(p),['(',num2str(t1(p)),',',num2str(y1(p),12),')'],'color','b');
text(t1(1),y1(1),['(',num2str(t1(1)),',',num2str(y1(1)),')'],'color','b');
text(t1(end),y1(end),['(',num2str(t1(end)),',',num2str(y1(end)),')'],'color','b');
hold off

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

function r=Fun(c)
    h1=0.01;
    t1=0:h1:1;
    n1=length(t1)-2;
    
    u1=linspace(0,1,n1);

    y1(:,1)=u1;

    k=1;
    while(1)
        J=zeros(n1);
        J(1,1:2)=[-(2+c*h1^2)+2*c*h1^2*y1(1,k),1];
        J(n1,end-1:end)=[1,-(2+c*h1^2)+2*c*h1^2*y1(end,k)];
        for i=2:n1-1
            J(i,i-1:i+1)=[1,-(2+c*h1^2)+2*c*h1^2*y1(i,k),1];
        end
        delta=J\(-f(y1(:,k),h1,c));
        y1(:,k+1)=y1(:,k)+delta;
        k=k+1;
        if(norm(y1(:,k)-y1(:,k-1))<1e-6)
            break
        end
        if(k>=1e4)
            error('diverge')
        end
    end
    y1=[0,transpose(y1(:,end)),1];
    r=y1(t1==0.5)-0.25;
end

function r=f(y,h,c)
    r=zeros(length(y),1);
    r(1)=-(2+c*h^2)*y(1)+c*h^2*y(1)^2+y(2);
    r(end)=-(2+c*h^2)*y(end)+c*h^2*y(end)^2+y(end-1)+1;
    for j=2:length(y)-1
        r(j)=y(j-1)-(2+c*h^2)*y(j)+c*h^2*y(j)^2+y(j+1);
    end
end