clear
clc

f = @(t,y) [((1-y(1)).*sin(y(1))+y(2).*cos(y(2)))./((sin(y(1))).^2+(cos(y(2))).^2);
             (-1*y(2).*sin(y(1))+(1-y(1)).*cos(y(2)))./((sin(y(1))).^2+(cos(y(2))).^2)];

span = [0 50]; 
y0 = [0;0]; 
h = 0.01;

[t,y] = RK4(f,span,y0,h); 

plot(t,y(1,:));
hold on 
plot(t,y(2,:));
legend('y1','y2')