clear
clc

f=@(t,y) (1+t)./(1+y);

Y=@(t) sqrt(t.^2+2*t+6)-1;

u=linspace(1,2,1000);
v=Y(u);
plot(u,v)

h=0.25;
t=1:h:2;
y(1)=2;

for i=1:length(t)-1
    y(i+1)=y(i)+h*f(t(i),y(i));
end
hold on
plot(t,y,'--')
legend('accurate','h=0.25')
xlabel('t')
ylabel('y')
title('y=f(t)')
hold off

e_local(1)=0;
for i=1:length(t)-1
    C=(y(i)^2+2*y(i)-t(i)^2-2*t(i))/2;
    g=@(t) sqrt(t.^2+2*t+2*C+1)-1;
    e_local(i+1)=g(t(i+1))-y(i+1);
end

e_global=Y(t)-y;
figure
plot(t,e_local,'o')
hold on
plot(t,e_global,'*')
legend('local','global')
xlabel('t')
ylabel('e')
title('Îó²î')
hold off