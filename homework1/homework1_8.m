step=0.001;
t1=-1:step:-eps;
t2=eps:step:1;
x1=sin(1./t1);
x2=sin(1./t2);
plot(t1,x1)
hold on
plot(t2,x2)
hold off
title(['step=',num2str(step)])