t=0:0.001:2*pi;
x=16*sin(t).^3;
y=13*cos(t)-5*cos(t*2)-2*cos(3*t)-cos(4*t);
plot(x,y)
xlabel('x')
ylabel('y')
title('heart4')
axis equal