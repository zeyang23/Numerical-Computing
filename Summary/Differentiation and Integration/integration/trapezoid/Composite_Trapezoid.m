 function I = Composite_Trapezoid(f,a,b,m)

    x = linspace(a,b,m+1);
    h = (b-a)/m;
    y = f(x);
    I = h/2*(y(1)+y(m+1)+2*sum(y(2:m)));
    
 end