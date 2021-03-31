function x=Newton(f,d_f,x0)
    x=[];
    x(1)=x0;
    ii=1;
    while(1)
        x(ii+1)=x(ii)-f(x(ii))./d_f(x(ii));
        ii=ii+1;
        if(abs(x(ii-1)-x(ii))<1e-5)
            break
        end
    end
end