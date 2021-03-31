clear
clc
f = @(y) [y(3);
          y(4);
          8*(y(5)-y(1))./(((y(1)-y(5)).^2+(y(2)-y(6)).^2).^1.5);
          8*(y(6)-y(2))./(((y(1)-y(5)).^2+(y(2)-y(6)).^2).^1.5);
          y(7);
          y(8);
          4*(y(1)-y(5))./(((y(1)-y(5)).^2+(y(2)-y(6)).^2).^1.5);
          4*(y(2)-y(6))./(((y(1)-y(5)).^2+(y(2)-y(6)).^2).^1.5)];
y = [1;1;0;-1;0;0;0;1];
h = 0.01;
t = linspace(0,5,5/h+1);
for i=1:length(t)-1
    y(:,i+1) = y(:,i)+h*RK4(f,y(:,i),h);
end


figure
plot(y(1,:),y(2,:),'--');
hold on
plot(y(5,:),y(6,:),'--');
hold off
legend('1','2')
xlabel('x')
ylabel('y')
title('1和2的运动')

figure
for i = 1:length(t)
    p1 = plot(y(1,i),y(2,i),'o','MarkerSize',6,'MarkerFaceColor','blue');
    hold on
    p2 = plot(y(5,i),y(6,i),'o','MarkerSize',6,'MarkerFaceColor','red');
    axis([0,1,0,3]);
    pause(0.1);
    delete(p1);
    delete(p2);
end 

function k = RK4(f,y,h)
    k1 = f(y);
    k2 = f(y+h*k1/2);
    k3 = f(y+h*k2/2);
    k4 = f(y+h*k3);
    k=(k1+2*k2+2*k3+k4)/6; 
end
