function [xh,yh]=Cubic_Bezier_Curve (x,y,t)
    n = length(x);
    m = length(t);
    A_x = zeros(1,n-1);
    A_y = zeros(1,n-1);
    B_x = zeros(1,n-1);
    B_y = zeros(1,n-1);
    
    A_x(1) = x(1)+(x(2)-x(1))/4;
    A_y(1) = y(1)+(y(2)-y(1))/4;
    B_x(n-1) = x(n)-(x(n)-x(n-1))/4;
    B_y(n-1) = y(n)-(y(n)-y(n-1))/4;
    
    for i = 2:n-1
        A_x(i) = x(i)+(x(i+1)-x(i-1))/4;
        A_y(i) = y(i)+(y(i+1)-y(i-1))/4;
    end
    
    for j = 1:n-2
        B_x(j) = x(j+1)-(x(j+2)-x(j))/4;
        B_y(j) = y(j+1)-(y(j+2)-y(j))/4;
    end
    
    x0 = zeros(n-1,m);
    y0 = zeros(n-1,m);
    
    for k=1:n-1
        xc = [x(k) A_x(k) B_x(k) x(k+1)];
        yc = [y(k) A_y(k) B_y(k) y(k+1)];
        [x0(k,:),y0(k,:)] = Bezier_Curve(xc,yc,t);
    end
    
    xh = reshape(x0',[1,m*(n-1)]);
    yh = reshape(y0',[1,m*(n-1)]);

end