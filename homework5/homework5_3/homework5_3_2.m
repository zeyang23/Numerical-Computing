x=[-1,0,1,2];
y=[13.45,3.01,0.67,0.15];
fun=@(c) y-1./(c(1).*x+c(2)).^2;
C=lsqnonlin(fun,[0.3,0.6]);
fprintf('c1 c2分别为\n')
disp(C)
fprintf('RMSE\n')
RMSE=norm(fun(C))./sqrt(length(x));
disp(RMSE)

f=@(t) 1./(C(1).*t+C(2)).^2;
u=linspace(-1,2,1000);
v=f(u);
plot(x,y,'o',u,v)
xlabel('x')
ylabel('y')
title('拟合结果')
legend('raw data','lsqnonlin fit')