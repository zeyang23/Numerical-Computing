clear
clc

h=0.1;
t=0:h:1;
n=length(t);

A=zeros(n);
for i=1:n
    if(i==1)
        for j=1:n
            A(1,j)=(0)^(j-1);
        end
    elseif(i==n)
        for j=1:n
            A(n,j)=1^(j-1);
        end
    else
        for j=1:n
            A(i,j)=(j-1)*(j-2)*t(i)^(j-3)+2*(j-1)*t(i).^(j-2)-3*t(i)^(j-1);
    end
    end
end

b=zeros(n,1);
b(1)=exp(3);
b(n)=1;
c=fliplr(transpose(A\b));
y=polyval(c,t);
plot(t,y)

hold on
bvpfcn=@(x,y) [y(2);3*y(1)-2*y(2)];
bcfcn=@(ya,yb) [ya(1)-exp(3);yb(1)-1];
guess=@(x) [-x;1];
h=1e-3;
tmesh = linspace(0,1,1/h+1);
solinit = bvpinit(tmesh, guess);
sol = bvp5c(bvpfcn, bcfcn, solinit);
Y=sol.y(1,:);
plot(sol.x,Y,'--')
xlabel('t')
ylabel('y')
title('solution 节点')
legend('collocation','bvp5c')

figure
hold on
u=linspace(0,1);
v=polyval(c,u);
plot(u,v);
plot(sol.x,Y,'--')
xlabel('t')
ylabel('y')
title('solution 区间')
legend('collocation','bvp5c')