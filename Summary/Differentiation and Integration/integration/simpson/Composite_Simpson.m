function I = Composite_Simpson(f,a,b,m)

    x = linspace(a,b,2*m+1);
    h = (b-a)/(2*m);
    y = f(x);
    y_odd = y(1:2:end);
    y_even = y(2:2:end);
    I = h/3*(y(1)+y(end)+4*sum(y_even)+2*sum(y_odd(2:end-1)));
    
end