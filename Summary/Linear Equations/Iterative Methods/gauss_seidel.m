function [x,k]=gauss_seidel(A,b,x0,xf,TOL)
    n=length(A);
    L=tril(A,-1);
    U=triu(A,1);
    D=A-L-U;
    
    k=1;
    x(:,1)=x0;
    while(true)
        x(:,k+1)=x(:,k);
        for i=1:n
            temp=inv(D)*(b-(L+U)*x(:,k+1));
            x(i,k+1)=temp(i);
        end
        
        k=k+1;
        if(norm(x(:,end)-xf,inf)<TOL)
            break
        end
    end
    x=x(:,end);
    k=k-1;
end