clear
clc
f=@(t,y) -y+t.*sqrt(y);

h1=0.5;
t1=2:h1:3;
y1(1)=2;

for i=1:length(t1)-1
    y1(i+1)=y1(i)+h1*RK4(f,t1(i),y1(i),h1);
end

plot(t1,y1,'--o','MarkerSize',4,'Color','red')

hold on

h2=0.1;
t2=2:h2:3;
y2(1)=2;

for i=1:length(t2)-1
    y2(i+1)=y2(i)+h2*RK4(f,t2(i),y2(i),h2);
end

plot(t2,y2,'--+','MarkerSize',4,'Color','blue')

h3=0.05;
t3=2:h3:3;
y3(1)=2;

for i=1:length(t3)-1
    y3(i+1)=y3(i)+h3*RK4(f,t3(i),y3(i),h3);
end

plot(t3,y3,'--s','MarkerSize',4,'Color','green')

tspan = [2 3];
y0 = 2;
[t,y] = ode45(f, tspan, y0);
plot(t,y,'--*','MarkerSize',4,'Color','black')

legend('h=0.5','h=0.1','h=0.05','ode45')
xlabel('t')
ylabel('y')
title('y=f(t)')
hold off