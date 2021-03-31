function [f_min,xx,n] = Newton_Optimization(f,df1,df2,x0,TOL)
    x(:,1) = x0;
    i = 1;
    while true
        x(:,i+1) = x(:,i) - df1(x(:,i))/df2(x(:,i));
        if(norm(x(:,i+1)-x(:,i))<TOL && df1(x(:,i+1))<TOL)
            xx = x(:,i+1);
            f_min = f(xx);
            break;
        end
        i = i+1;
    end
    n=size(x,2)-1;
end