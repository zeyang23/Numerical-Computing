clear
clc

u=linspace(0.05,0.15);
v=zeros(size(u));
for i=1:length(u)
    v(i)=F(u(i));
end
plot(u,v)
hold on
plot(u,zeros(size(u)))
hold off
xlabel('C')
ylabel('u_t')
title('u_t(x=5,t=10)随C的变化')

a=0.05;b=0.15;
TOL=0.5e-6;
C=Bisection(@F,a,b,TOL);
C_accurate=pi^2/100;
e=abs(C-C_accurate);
fprintf('求得C为\n')
disp(C)
fprintf('理论值\n')
disp(C_accurate)
fprintf('误差\n')
disp(e)

L=10;
a=0;b=L;
h=0.05;

ts=0;te=10;
k=0.05;

D=1;

f=@(x) (sin(pi/10*x)).^2;
left=@(t) 0;
right=@(t) 0;

[t1,x1,w1]=diffusion_cn(a,b,h,ts,te,k,D,C,f,left,right);

figure
mesh(t1,x1,w1)
xlabel('t')
ylabel('x')
zlabel('u(x,t)')
title('h=0.05 k=0.05 C为求得的临界值')

function ut=F(C)
    L=10;
    a=0;b=L;
    h=0.05;

    ts=0;te=10;
    k=0.05;

    D=1;

    f=@(x) (sin(pi/10*x)).^2;
    left=@(t) 0;
    right=@(t) 0;
    
    [~,~,w]=diffusion_cn(a,b,h,ts,te,k,D,C,f,left,right);
    ut=1/k*(w((end+1)/2,end)-w((end+1)/2,end-1));
end