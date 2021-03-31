x=-2:0.01:2;
y1=(1-(abs(x)-1).^2).^0.5;
y2=acos(1-abs(x))-pi;
plot(x,y1)
xlabel('x')
ylabel('y')
title('heart1')
axis equal
hold on
plot(x,y2)
axis equal