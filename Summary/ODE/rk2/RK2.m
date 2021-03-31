% span的格式为[a,b]
% 如果要处理多元问题，f返回列向量，y0设为列向量
function [t,y] = RK2(f,tspan,y0,h)
    % Explicit Trapezoid
    a1=1/2;
    a2=1/2;
    
%     % Midpoint
%     a1=0;
%     a2=1;
    t = tspan(1):h:tspan(2); 
    y(:,1) = y0;
    for i = 1:length(t)-1
        k1 = f(t(i),y(:,i));
        k2 = f(t(i)+1/(2*a2)*h,y(:,i)+1/(2*a2)*k1*h);
        k=k1*a1+k2*a2;
        y(:,i+1) = y(:,i)+h*k; 
    end
end