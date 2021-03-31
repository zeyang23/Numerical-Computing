function [Q,R]=QR_Schmidt(A)
    [m,n]=size(A);
    q(:,1)=A(:,1)./norm(A(:,1));
    r(1,1)=norm(A(:,1));
    for i=2:n
        y=A(:,i);
        for j=1:i-1
            r(j,i)=transpose(q(:,j))*A(:,i);
            y=y-r(j,i).*q(:,j);
        end
        r(i,i)=norm(y);
        q(:,i)=y./r(i,i);
    end
    Q=q;
    R=r;
    
    if(m>n)
        R=[R;zeros(m-n,n)];
    end
end