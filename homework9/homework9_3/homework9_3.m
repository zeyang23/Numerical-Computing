clear
clc

a=0;b=1;
h=0.1;

ts=0;te=1;
k1=0.1;

D=2;

f=@(x) exp(x);
left=@(t) exp(2*t);
right=@(t) exp(2*t+1);

[t1,x1,w1]=heat_cn(a,b,h,ts,te,k1,D,f,left,right);

mesh(t1,x1,w1)
xlabel('t')
ylabel('x')
zlabel('u(x,t)')
title('h=0.1 k=0.1')

sol = pdepe(0,@pdex1pde,@pdex1ic,@pdex1bc,x1,t1);
% Extract the first solution component as u.
w2 = transpose(sol(:,:,1));

% A surface plot is often a good way to study a solution.
% figure
% mesh(t1,x1,w2) 
% title('h=0.1 k=0.1')
% xlabel('t')
% ylabel('x')
% zlabel('u(x,t)')

k3=0.0025;
[t3,x3,w3]=heat_fd(a,b,h,ts,te,k3,D,f,left,right);
% figure
% mesh(t3,x3,w3) 
% title('h=0.1 k=0.0025')
% xlabel('t')
% ylabel('x')
% zlabel('u(x,t)')

k4=0.0025;
[t4,x4,w4]=heat_bd(a,b,h,ts,te,k4,D,f,left,right);

u=@(x,t) exp(2*t+x);
y=u(transpose(x1),1);

e1=abs(transpose(w1(:,end)-y));
e2=abs(transpose(w2(:,end)-y));
e3=abs(transpose(w3(:,end)-y));
e4=abs(transpose(w4(:,end)-y));

figure
grid on
hold on
plot(x1,e1,'-o')
plot(x1,e2,'-o')
plot(x1,e3,'-o')
plot(x1,e4,'-o')
hold off
xlabel('x')
ylabel('error')
title('comparison')
legend('crank nicolson','pdepe','forward difference','backward difference')

% --------------------------------------------------------------
function [c,f,s] = pdex1pde(~,~,~,DuDx)
c = 1/2;
f = DuDx;
s = 0;
end
% --------------------------------------------------------------
function u0 = pdex1ic(x)
u0 = exp(x);
end
% --------------------------------------------------------------
function [pl,ql,pr,qr] = pdex1bc(~,ul,~,ur,t)
pl = ul-exp(2*t);
ql = 0;
pr = ur-exp(2*t+1);
qr = 0;
end