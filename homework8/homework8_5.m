clear
clc

h1=0.1;
t1=0:h1:1;
n1=length(t1)-2;
alpha1=@(i) 4/3*h1+2/h1+4*h1^3*(1/5+(i-1)/2+(i-1)^2/3 + 1/30+i/6+i^2/3);
beta1=@(i) 1/3*h1-1/h1+4*h1^3*(1/20+i/6+i^2/6);

A1=zeros(n1);
A1(1,1:2)=[alpha1(1),beta1(1)];
A1(end,end-1:end)=[beta1(n1-1),alpha1(n1)];
for K=2:n1-1
    A1(K,K-1:K+1)=[beta1(K-1),alpha1(K),beta1(K)];
end

b1=zeros(n1,1);
b1(1)=-1*beta1(0);
b1(end)=-exp(1)*beta1(n1);
c1=A1\b1;
c1=transpose([1;c1;exp(1)]);

h2=0.05;
t2=0:h2:1;
n2=length(t2)-2;
alpha2=@(i) 4/3*h2+2/h2+4*h2^3*(1/5+(i-1)/2+(i-1)^2/3 + 1/30+i/6+i^2/3);
beta2=@(i) 1/3*h2-1/h2+4*h2^3*(1/20+i/6+i^2/6);

A2=zeros(n2);
A2(1,1:2)=[alpha2(1),beta2(1)];
A2(end,end-1:end)=[beta2(n2-1),alpha2(n2)];
for K=2:n2-1
    A2(K,K-1:K+1)=[beta2(K-1),alpha2(K),beta2(K)];
end

b2=zeros(n2,1);
b2(1)=-1*beta2(0);
b2(end)=-exp(1)*beta2(n2);
c2=A2\b2;
c2=transpose([1;c2;exp(1)]);

f=@(t) exp(t.^2);
u=linspace(0,1);
plot(t1,c1,'-*','MarkerSize',2)
hold on
plot(t2,c2,'-o','MarkerSize',2)
plot(u,f(u))
hold off
xlabel('t')
ylabel('y')
title('solution 节点')
legend('n=9','n=19','解析解','Location','NorthWest')

figure
plot(t1,abs(c1-f(t1)),'-*','MarkerSize',4)
hold on
plot(t2,abs(c2-f(t2)),'-o','MarkerSize',4)
hold off
xlabel('t')
ylabel('误差')
title('误差图 节点')
legend('n=9','n=19','Location','NorthWest')

figure
u=linspace(0,1);
v1=cal(t1,c1,u);
v2=cal(t2,c2,u);
plot(u,v1,'-*','MarkerSize',2)
hold on
plot(u,v2,'-o','MarkerSize',2)
plot(u,f(u))
hold off
xlabel('t')
ylabel('y')
title('solution 区间')
legend('n=9','n=19','解析解 区间','Location','NorthWest')

figure
plot(u,v1-f(u),'-*','MarkerSize',2)
hold on
plot(u,v2-f(u),'-*','MarkerSize',2)
hold off
xlabel('t')
ylabel('误差')
title('误差图 区间')
legend('n=9','n=19','Location','NorthWest')

function v=cal(t,c,u)
    % 根据系数向量c和节点向量t计算函数值
    % 利用了数组的逻辑索引法
    delta=diff(t);
    
    t1=t(2:end);
    K1=length(t1)*ones(size(u));
    c1=c(1:end-1);
    for i=length(t1):-1:1
        K1(t1(i)>u)=i;
    end
    s1=c1(K1).*(t1(K1)-u)./delta(K1);
    
    K2=ones(size(u));
    t2=t(1:end-1);
    c2=c(2:end);
    for j=1:length(t2)
        K2(t2(j)<=u)=j;
    end
    s2=c2(K2).*(u-t2(K2))./delta(K2);
    v=s1+s2;
end