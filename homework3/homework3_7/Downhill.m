function x=Downhill(f,d_f,x0)
    x=[];
    x(1)=x0;
    ii=1;
    while(1)
        x(ii+1)=x(ii)-f(x(ii))./d_f(x(ii));
        n=1;
        while(abs(f(x(ii+1)))>abs(f(x(ii))))
            x(ii+1)=x(ii)-1/2^n*f(x(ii))./d_f(x(ii));
            n=n+1;
        end
        ii=ii+1;
        if(abs(x(ii-1)-x(ii))<1e-5)
            break
        end
    end
end