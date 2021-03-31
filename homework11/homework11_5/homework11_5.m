clear
clc

t=(0:7)/8;
y=[1 0 -2 1 3 0 -2 1];

u=linspace(0,1,10001);

v1 = DFT_Least_Square_Fitting (t,y,u,4);

v2 = DFT_Least_Square_Fitting (t,y,u,6);

v3 = DFT_Least_Square_Fitting (t,y,u,8);

hold on
plot(t,y,'*')
plot(u,v1)
plot(u,v2)
plot(u,v3)

legend('Êý¾Ýµã','m=4','m=6','m=8');
xlabel('t');
ylabel('y');
title('DFT Least Square Fitting'); 
hold off