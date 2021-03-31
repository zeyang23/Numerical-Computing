function xsolve=Newton_nd(f,Jacob,x0,TOL)
    % f����n*1������ 
    % Jacob����n*n����
    % x��n*1������
    
    x(:,1)=x0;
    k=1;
    while(1)
        J=Jacob(x(:,k));
        b=f(x(:,k));
        delta=-J\b;
        x(:,k+1)=x(:,k)+delta;
        k=k+1;
        if(norm(x(:,k)-x(:,k-1))<TOL)
            break;
        end
    end
    xsolve=x(:,end);
end