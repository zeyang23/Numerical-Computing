x=[-1,0,1,2];
y=[13.45,3.01,0.67,0.15];
fun=@(c) y-c(1).*exp(c(2).*x);
C=lsqnonlin(fun,[1,1]);
fprintf('c1 c2分别为\n')
disp(C)
fprintf('RMSE\n')
RMSE=norm(fun(C))./sqrt(length(x));
disp(RMSE)

f=@(t) C(1).*exp(C(2).*t);
u=linspace(-1,2,1000);
v=f(u);
plot(x,y,'o',u,v)
xlabel('x')
ylabel('y')
title('拟合结果')
legend('raw data','lsqnonlin fit')