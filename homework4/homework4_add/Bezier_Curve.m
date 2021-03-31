function [xh,yh]=Bezier_Curve (x,y,t)
    n = length(x);
    m = length(t);
    xh = zeros(1,m);
    yh = zeros(1,m); 
    xc = zeros(n,m);
    yc = zeros(n,m);
    
    for i = 0 : n-1
        xc(i+1,:) = factorial(n-1)/(factorial(i)*factorial(n-1-i)).*(1-t).^(n-1-i).*t.^i*x(i+1);
        yc(i+1,:) = factorial(n-1)/(factorial(i)*factorial(n-1-i)).*(1-t).^(n-1-i).*t.^i*y(i+1);
    end
    xh = sum(xc);
    yh = sum(yc);
end