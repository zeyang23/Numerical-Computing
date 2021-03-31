clear
clc
addpath(genpath('.'));
figure
hold on

x1 = [0 1 5];
y1 = [0 3.5 5];
plot(x1,y1,'co','MarkerFaceColor','b');

t = linspace(0,1);

[xh1,yh1] = Bezier_Curve(x1,y1,t);
plot(xh1,yh1,'b');

plot(2,6,'co','MarkerFaceColor','r')

x2 = [0 1 2 5];
y2 = [0 3.5 6 5];

[xh2,yh2] = Bezier_Curve(x2,y2,t);
plot(xh2,yh2,'r');

legend('Original Points','Original Bezier Curve','New Point','New Bezier Curve')
title('Bezier Curve')
xlabel('x')
ylabel('y')
hold off
rmpath(genpath('.'));