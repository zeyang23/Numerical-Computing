function csolve=levenberg_marquardt(f,Jacob,c0,TOL)
    % r返回n*1列向量 
    % Dr返回n*n矩阵
    % c0是n*1列向量
    
    lambda=0.005;
    
    c(:,1)=c0;
    k=1;
    while(1)
        A=Jacob(c(:,k));
        Temp=transpose(A)*A;
        delta=-(Temp+lambda*diag(Temp))\(transpose(A)*f(c(:,k)));
        c(:,k+1)=c(:,k)+delta;
        
        if(norm(f(c(:,k+1)))<=norm(f(c(:,k))))
            k=k+1;
            lambda=lambda/2;
        else
            c(:,k+1)=[];
            lambda=lambda*2;
            continue
        end
        
        if(norm(c(:,k)-c(:,k-1))<TOL)
            break;
        end
    end
    csolve=c(:,end);
end