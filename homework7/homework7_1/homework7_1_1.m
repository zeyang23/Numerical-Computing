clear
clc
f=@(t,y) (1+t)./(1+y);

h1=0.1;
t1=1:h1:2;
y1(1)=2;

for i=1:length(t1)-1
    y1(i+1)=y1(i)+h1*f(t1(i),y1(i));
end

plot(t1,y1)

h2=0.001;
t2=1:h2:2;
y2(1)=2;

for j=1:length(t2)-1
    y2(j+1)=y2(j)+h2*f(t2(j),y2(j));
end

hold on
plot(t2,y2,'--')
legend('h=0.1','h=0.001')
xlabel('t')
ylabel('y')
title('y=f(t)')
