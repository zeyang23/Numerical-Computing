function X=mysqrt(x)
    X=x;
    f=@(t) 0.5*(t+x./t);
    k=1;
    while(1)
        X=f(X);
        k=k+1;
        if(norm(X-sqrt(x))<1e-6)
            break
        end
    end
end
