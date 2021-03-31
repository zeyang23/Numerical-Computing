 function I = Composite_Trapezoid(f,lb,ub,m)

    x = linspace(lb,ub,m+1);
    h = (ub-lb)/m;
    y = f(x);
    I = h/2*(y(1)+y(m+1)+2*sum(y(2:m)));
    
 end