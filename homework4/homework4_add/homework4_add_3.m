clear
clc
addpath(genpath('.'));
figure
hold on

x = [0 0 0 1 2 3 4 4 ];
y = [0 1 2 2 2 2 2 1 ];
plot(x,y,'o','MarkerFaceColor','blue');

t = linspace(0,1);
[xh,yh] = Bezier_Curve(x,y,t);
plot(xh,yh);

[xm,ym] = Cubic_Bezier_Curve(x,y,t);
plot(xm,ym,'--blue');

% ·Ö¶Î
x1 = [0,0,0,1];
y1 = [0,1,2,2];
x2 = [2,3,4,4];
y2 = [2,2,2,1]; 
[u1,v1] = Bezier_Curve(x1,y1,t);
[u2,v2] = Bezier_Curve(x2,y2,t);
plot(u1,v1,'green',u2,v2,'green',[1,2],[2,2],'green'); 


legend('Points','Bezier Curve','Cubic Bezier Curve','Divided Bezier Curve')
title('Cubic Bezier Curve')
xlabel('x')
ylabel('y')
hold off
rmpath(genpath('.'));