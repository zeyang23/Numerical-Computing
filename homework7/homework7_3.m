clear
clc

f=@(t,y) 1+t.*sin(t.*y);
tspan = [0 2];
y0 = 0;
[t,y] = ode23(f, tspan, y0);
plot(t,y,'-o','MarkerSize',4)

h1=0.02;
t1=0:h1:2;
y1(1)=0;

d_f=@(t,y) t.*y.*cos(t.*y)+sin(t.*y);

for i=1:length(t1)-1
    y1(i+1)=y1(i)+h1*f(t1(i),y1(i))+h1^2/2*d_f(t1(i),y1(i));
end
hold on
plot(t1,y1,'--*','MarkerSize',4)
legend('ode23','2-order tayler')
xlabel('t')
ylabel('y')
title('y=f(t)')