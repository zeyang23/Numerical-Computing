function X=Secant(f,x0,x1,TOL)
    % f是匿名函数
    % x0和x1是迭代初值
    x=[];
    x(1)=x0;
    x(2)=x1;
    k=2;
    while(1)
        x(k+1)=x(k)-f(x(k)).*(x(k)-x(k-1))./(f(x(k))-f(x(k-1)));
        k=k+1;
        if(abs(x(k)-x(k-1))<TOL)
            break
        end
    end
    X=x(end);
end