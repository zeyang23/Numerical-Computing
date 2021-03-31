function [f_min,xx,n] = Inaccurate_Line_Search(f,grad,epsilon,w,alpha_0,x0,TOL)
    x(:,1) = x0;
    i = 1;
    while true
        alpha = alpha_0;
        while (1)
            d_k = -grad(x(:,i));
           
            if f(x(:,i) + alpha * d_k) <= f(x(:,i)) + epsilon * alpha * grad(x(:,i)) * d_k
                alpha_k = alpha;
                x(:,i+1) = x(:,i) + alpha_k * d_k;
                break;
            end
            alpha = alpha * w;
        end
        if norm(x(:,i+1)-x(:,i)) < TOL
            break;
        end
        i = i + 1;
    end
    xx = x(:,i+1);
    f_min = f(xx);
    n=size(x,2)-1;
end