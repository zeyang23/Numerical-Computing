% 参考：Sauer 数值分析
function [I,k] = Adaptive_Quadrature_Trap(f,a0,b0,TOL)
    a(1)=a0;
    b(1)=b0;
    tol(1) = TOL;
    I = 0; 
    n=1;
    k=1;
    app(1)=Trapezoid_Integration(f,a(1),b(1));
    while n > 0
        c = (a(n)+b(n))/2;
        oldapp = app(n);
        app(n) = Trapezoid_Integration(f,a(n),c);
        app(n+1) = Trapezoid_Integration(f,c,b(n));
        if abs(oldapp-(app(n)+app(n+1))) < 3*tol(n)
            I = I+app(n)+app(n+1);
            n = n-1; 
            
        else
            b(n+1) = b(n);
            b(n) = c;
            a(n+1) = c;
            tol(n) = tol(n)/2;
            tol(n+1) = tol(n);
            n = n+1;
        end
        k=k+1;
    end
end

 
function I = Trapezoid_Integration(f,lb,ub)
    x = [lb,ub];
    h = ub-lb;
    y = f(x);
    I = h / 2 * sum(y);  
end