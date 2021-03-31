% span�ĸ�ʽΪ[a,b]
% ���Ҫ�����Ԫ���⣬f������������y0��Ϊ������
function [t,y] = RK4(f,tspan,y0,h)
    t = tspan(1):h:tspan(2); 
    y(:,1) = y0;
    for i = 1:length(t)-1
        k1 = f(t(i),y(:,i));
        k2 = f(t(i)+h/2,y(:,i)+h*k1/2);
        k3 = f(t(i)+h/2,y(:,i)+h*k2/2);
        k4 = f(t(i)+h,y(:,i)+h*k3);
        k=(k1+2*k2+2*k3+k4)/6;
        y(:,i+1) = y(:,i)+h*k; 
    end
end