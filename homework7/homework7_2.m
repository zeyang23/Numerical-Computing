clear all
clc
f=@(t,y) 2./t.*y+t.^2*exp(t);
h1=0.2;
t1=1:h1:2;
y1(1)=0;

for i=1:length(t1)-1
    y1(i+1)=y1(i)+h1/2*(f(t1(i),y1(i))+f(t1(i)+h1,y1(i)+h1*f(t1(i),y1(i))));
end

h2=0.02;
t2=1:h2:2;
y2(1)=0;

for i=1:length(t2)-1
    y2(i+1)=y2(i)+h2/2*(f(t2(i),y2(i))+f(t2(i)+h2,y2(i)+h2*f(t2(i),y2(i))));
end

plot(t1,y1)
hold on
plot(t2,y2,'--')
legend('h=0.2','h=0.02')
xlabel('t')
ylabel('y')
title('y=f(t)')
hold off


syms t Y(t)
z=dsolve(diff(Y)==2./t.*Y+t.^2*exp(t),Y(1)==0);
Z=matlabFunction(z);

figure
e1=Z(t1)-y1;
e2=Z(t2)-y2;
plot(t1,e1,'-*','MarkerSize',4)
hold on
plot(t2,e2,'-*','MarkerSize',4)
legend('h=0.2','h=0.02')
xlabel('t')
ylabel('Îó²î')
title('Îó²îÍ¼')
hold off

