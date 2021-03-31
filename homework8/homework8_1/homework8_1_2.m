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

s=fzero(@Fun,1);

f=@(t,y) [y(2);sin(y(2))];
y0=[1;s];
h=0.01;
t=0:h:1; 
y(:,1)=y0;
for i=1:length(t)-1
    y(:,i+1)=y(:,i)+h*f(t(i),y(:,i));
end
figure
plot(t,y(1,:))
xlabel('t')
ylabel('y')
title('solution fzero')

figure
plot(t,y(1,:))

bcfcn=@(ya,yb) [ya(1)-1;yb(1)+1];
guess=@(x) [sin(x);sin(x)];
tmesh = linspace(0,1,1/h+1);
solinit = bvpinit(tmesh, guess);
sol = bvp4c(f, bcfcn, solinit);

hold on
Y=sol.y(1,:);
plot(sol.x,Y,'*','MarkerSize',2)
hold off
xlabel('t')
ylabel('y')
title('solution')
legend('fzero','bvp4c')

function r=Fun(s)
    f=@(t,y) [y(2);sin(y(2))];
    y0=[1;s];
    h=0.01;
    t=0:h:1; 
    y(:,1)=y0;
    for i=1:length(t)-1
        y(:,i+1)=y(:,i)+h*f(t(i),y(:,i));
    end
    r=y(1,end)+1;
end