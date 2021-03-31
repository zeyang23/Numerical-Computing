function X=Secant(f,x0,x1)
    x=[];
    x(1)=x0;
    x(2)=x1;
    ii=2;
    while(1)
        x(ii+1)=x(ii)-f(x(ii)).*(x(ii)-x(ii-1))./(f(x(ii))-f(x(ii-1)));
        ii=ii+1;
        if(abs(x(ii-1)-x(ii))<1e-4)
            break
        end
    end
    X=x(end);
end