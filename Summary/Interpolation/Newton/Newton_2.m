% ���������ʽϵ���������������ٴ���u��v
function v=Newton_2(x,y,u)
    n=length(x);
    f=zeros(n);
    % f�ǲ��̱������Ǿ���
    for i=1:n
        f(i,1)=y(i);
    end
    for k=2:n
        for j=k:n
            f(j,k)=(f(j,k-1)-f(j-1,k-1))./(x(j)-x(j-k+1));
        end
    end
    disp(f)
    
    % F������ţ�ٲ��̣�ÿһ���ϵ����
    F=diag(f);
    L=zeros(n);
    L(1,:)=[zeros(1,n-1) F(1)];
    for ii=2:n
        r=1;
        for jj=1:ii-1
            r=conv(r,poly(x(jj)));
        end
        L(ii,:)=F(ii).*[zeros(1,n-ii) r];
    end
    P=sum(L);
    v=polyval(P,u);
end