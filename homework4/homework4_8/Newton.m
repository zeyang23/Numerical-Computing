function X=Newton(f,x0,error)
    % f是匿名函数
    % x0为迭代初值
    d_f=matlabFunction(diff(sym(f)));
    x=[];
    x(1)=x0;
    ii=1;
    while(1)
        x(ii+1)=x(ii)-f(x(ii))./d_f(x(ii));
        ii=ii+1;
        if(abs(x(ii)-x(ii-1))<error)
            break
        end
    end
    X=x(end);
end