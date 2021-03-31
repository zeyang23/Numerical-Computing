function [f_min,xx,n] = Quasi_Newton_Optimization(f,x0,dx,TOL)
    x_origin = x0;
    n=0;
    while true
       x_new = x_origin - dx*(f(x_origin+dx)-f(x_origin-dx))/(2*(f(x_origin+dx)+f(x_origin-dx)-2*f(x_origin)));
       n=n+1;
       if(abs(x_new-x_origin)<TOL)
           break;
       end
       x_origin = x_new;
    end
    xx = x_new;
    f_min = f(xx);
end