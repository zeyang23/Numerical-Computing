clear
clc

u=linspace(0.5,5);
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

figure
opt=optimset('Display','off');

s1=fsolve(@Fun,0.6,opt);
s2=fsolve(@Fun,1,opt);

f=@(t,y) [1./y(2);t+tan(y(1))];
h=0.01;
t=0:h:1; 

y1_0=[0;s1];
y1(:,1)=y1_0;
for i=1:length(t)-1
    y1(:,i+1)=y1(:,i)+h*f(t(i),y1(:,i));
end

y2_0=[0;s2];
y2(:,1)=y2_0;
for i=1:length(t)-1
    y2(:,i+1)=y2(:,i)+h*f(t(i),y2(:,i));
end

plot(t,y1)
legend('y1','y2')
xlabel('t')
ylabel('y')
title('solution1')

figure
plot(t,y2)
legend('y1','y2')
xlabel('t')
ylabel('y')
title('solution2')

function r=Fun(s)
    f=@(t,y) [1./y(2);t+tan(y(1))];
    y0=[0;s];
    h=0.01;
    t=0:h:1; 
    y(:,1)=y0;
    for i=1:length(t)-1
        y(:,i+1)=y(:,i)+h*f(t(i),y(:,i));
    end
    r=y(2,end)-2;
end