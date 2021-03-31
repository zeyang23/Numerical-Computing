function X=FixedPoint(g,x0,TOL)
    % g是构造的g(x)的函数句柄，最好是匿名函数
    % x0是迭代初值
    
    x(1)=x0;
    k=1;
    while(1)
        x(k+1)=g(x(k));
        k=k+1;
        if(abs(x(k)-x(k-1))<TOL)
            break
        end
    end
    X=x(end);
end
