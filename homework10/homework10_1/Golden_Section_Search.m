function [f_min,xx,n] = Golden_Section_Search(f,a,b,TOL)
    g = (sqrt(5)-1)/2;
    x1 = a + (1-g) * (b-a);
    f1 = f(x1);
    x2 = a + g * (b - a);
    f2 = f(x2);
    n=0;
    while (b - a) > TOL 
        if (f1 > f2)
            a = x1;
            x1 = x2;
            f1 = f2;
            x2 = a + g * (b - a); 
            f2 = f(x2); 
        else
            b=x2;
            x2 = x1;
            f2 = f1;
            x1 = a + (1-g) * (b-a);
            f1 = f(x1); 
        end
        n=n+1;
    end
    xx = (x1 + x2) / 2;
    f_min = f(xx);
end