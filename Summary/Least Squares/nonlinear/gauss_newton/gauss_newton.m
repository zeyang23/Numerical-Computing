function csolve=gauss_newton(f,Jacob,c0,TOL)
    % r����n*1������ 
    % Dr����n*n����
    % c0��n*1������
    
    c(:,1)=c0;
    k=1;
    while(1)
        A=Jacob(c(:,k));
        
        delta=-(transpose(A)*A)\(transpose(A)*f(c(:,k)));
        c(:,k+1)=c(:,k)+delta;
        k=k+1;
        if(norm(c(:,k)-c(:,k-1))<TOL)
            break;
        end
    end
    csolve=c(:,end);
end