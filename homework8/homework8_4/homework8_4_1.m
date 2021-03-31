clear
clc

h1=0.1;
t1=0:h1:1;
n1=length(t1)-2;

u1=linspace(0,1,n1);
g=@(x) 10*x.*(1-x);
v1=g(u1);

% 选用u1或v1作为初值会得到不同的结果
y1(:,1)=u1;
% y1(:,1)=v1;

k=1;
while(1)
    J=zeros(n1);
    J(1,1:2)=[-(2+10*h1^2)+20*h1^2*y1(1,k),1];
    J(n1,end-1:end)=[1,-(2+10*h1^2)+20*h1^2*y1(end,k)];
    for i=2:n1-1
        J(i,i-1:i+1)=[1,-(2+10*h1^2)+20*h1^2*y1(i,k),1];
    end
    delta=J\(-f(y1(:,k),h1));
    y1(:,k+1)=y1(:,k)+delta;
    k=k+1;
    if(norm(y1(:,k)-y1(:,k-1))<1e-6)
        break
    end
end
y1=[0,transpose(y1(:,end)),1];
plot(t1,y1)
hold on

h2=0.05;
t2=0:h2:1;
n2=length(t2)-2;

u2=linspace(0,1,n2);
g=@(x) 10*x.*(1-x);
v2=g(u2);

% 选用u2或v2作为初值会得到不同的结果
y2(:,1)=u2;
% y2(:,1)=v2;

k=1;
while(1)
    J=zeros(n2);
    J(1,1:2)=[-(2+10*h2^2)+20*h2^2*y2(1,k),1];
    J(n2,end-1:end)=[1,-(2+10*h2^2)+20*h2^2*y2(end,k)];
    for i=2:n2-1
        J(i,i-1:i+1)=[1,-(2+10*h2^2)+20*h2^2*y2(i,k),1];
    end
    delta=J\(-f(y2(:,k),h2));
    y2(:,k+1)=y2(:,k)+delta;
    k=k+1;
    if(norm(y2(:,k)-y2(:,k-1))<1e-6)
        break
    end
end
y2=[0,transpose(y2(:,end)),1];
plot(t2,y2)

bvpfcn=@(x,y) [y(2);10*y(1)*(1-y(1))];
bcfcn=@(ya,yb) [ya(1);yb(1)-1];
guess1=@(x) [x;1];
guess2=@(x) [10*x.*(1-x);10*(1-2*x)];
h=1e-3;
tmesh = linspace(0,1,1/h+1);
solinit = bvpinit(tmesh, guess1);
% solinit = bvpinit(tmesh, guess2);
sol = bvp4c(bvpfcn, bcfcn, solinit);
Y=sol.y(1,:);
plot(sol.x,Y,'--')
xlabel('t')
ylabel('y')
title('solution')
legend('h=0.1','h=0.05','bvp4c','Location','NorthWest')
hold off

function r=f(y,h)
    r=zeros(length(y),1);
    r(1)=-(2+10*h^2)*y(1)+10*h^2*y(1)^2+y(2);
    r(end)=-(2+10*h^2)*y(end)+10*h^2*y(end)^2+y(end-1)+1;
    for j=2:length(y)-1
        r(j)=y(j-1)-(2+10*h^2)*y(j)+10*h^2*y(j)^2+y(j+1);
    end
end