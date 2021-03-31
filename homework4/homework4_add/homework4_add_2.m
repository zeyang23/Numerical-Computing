clear
clc
addpath(genpath('.'));
figure
hold on

theta = linspace(0,6*pi);
r = theta;
polar(theta,r,'--r');


beta = linspace(0,6*pi,20);
rho = beta;
x = rho.*cos(beta);
y = rho.*sin(beta);

t = linspace(0,1);
plot(x,y,'o','MarkerFaceColor','green');

[xh,yh] = Bezier_Curve(x,y,t);
plot(xh,yh,'blue');

legend('Original','Control Points','Bezier Curve')
title('¶Ô±È')
xlabel('x')
ylabel('y')
hold off
rmpath(genpath('.'));