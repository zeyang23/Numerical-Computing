function X=Newton(f,d_f,x0)
    x=[];
    x(1)=x0;
    ii=1;
    while(1)
        x(ii+1)=x(ii)-f(x(ii))./d_f(x(ii));
        ii=ii+1;
        if(abs(x(ii-1)-x(ii))<1e-4)
            break
        end
    end
    X=x(end);
end