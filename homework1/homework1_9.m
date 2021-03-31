a=4;
t=0:0.001:4*pi;
x=10*sin(a*t).*cos(t);
y=10*sin(a*t).*sin(t);
plot(x,y,'r')
lgd = legend('eight leaves');
lgd.Title.String = 'Í¼Àý';
title('when a=4')
xlabel('x')
ylabel('y')
axis equal