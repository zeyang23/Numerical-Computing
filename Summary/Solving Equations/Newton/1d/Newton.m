function X=Newton(f,df,x0,TOL)

    x=[];
    x(1)=x0;
    k=1;
    while(1)
        x(k+1)=x(k)-f(x(k))./df(x(k));
        k=k+1;
        if(norm(x(k)-x(k-1))<TOL)
            break
        end
    end
    X=x(end);
end