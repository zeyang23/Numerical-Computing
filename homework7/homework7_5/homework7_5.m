clear
clc

f=@(x1,x2) [((1-x1).*sin(x1)+x2.*cos(x2))./((sin(x1)).^2+(cos(x2)).^2);
            (((1-x1).*cos(x2))-x2.*sin(x1))./((sin(x1)).^2+(cos(x2)).^2)];
h=0.1;
t=0:h:50;
y=[0;0];

for i=1:length(t)-1
    y(:,i+1)=y(:,i)+h*RK4(f,y(1,i),y(2,i),h);
end

plot(t,y(1,:))
hold on
plot(t,y(2,:))
legend('x1','x2')
xlabel('t')
ylabel('x')
title('x=x(t)')
hold off