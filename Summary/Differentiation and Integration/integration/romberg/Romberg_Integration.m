function [I,R] = Romberg_Integration(f,lb,ub,TOL)
    m=2;
    R(1,1) = (ub - lb) * (f(ub) + f(lb)) / 2;
    h(1) = ub - lb;
    
    x = linspace(lb,ub,3);
    y = f(x);
    h(2) = h(1) / 2;
    R(2,1) = 1 / 2 * R(1,1) + h(2) * sum(y(2:2:end));
    R(2,2) = (4 * R(2,1) - R(1,1)) / 3;

    
    while(abs(R(m,m)-R(m-1,m-1))>TOL)
        m=m+1;
        x = linspace(lb,ub,2^(m-1)+1);
        y = f(x);
        h(m) = h(m-1) / 2;
        R(m,1) = 1 / 2 * R(m-1,1) + h(m) * sum(y(2:2:end));
        for k = 2:m
            R(m,k) = (4^(k-1) * R(m,k-1) - R(m-1,k-1)) / (4^(k-1)-1);
        end
    end
    I = R(m,m);    
end