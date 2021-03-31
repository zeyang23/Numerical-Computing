function F = Richardson(f,x,h,n)

    F2=@(h) (f(x+h)+f(x-h)-2*f(x))./h.^2;
    
    F=zeros(n);

    for i=1:n
        F(i,1)= F2( h/2^(i-1) );
    end
    
    for j=2:n
        for k=2:j
            F(j,k)=(4^(k-1)*F(j,k-1)-F(j-1,k-1))/(4^(k-1)-1);
        end
    end
end