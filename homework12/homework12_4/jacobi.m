function [x,k]=jacobi(A,b,x0,xf,TOL)
    L=tril(A,-1);
    U=triu(A,1);
    D=A-L-U;
    
    k=1;
    x(:,1)=x0;
    while(true)
        x(:,k+1)=inv(D)*(b-(L+U)*x(:,k));
        k=k+1;
        if(norm(x(:,end)-xf,inf)<TOL)
            break
        end
    end
    x=x(:,end);
    k=k-1;
end