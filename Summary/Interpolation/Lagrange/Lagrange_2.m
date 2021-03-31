% 先求出多项式系数（行向量），再代入u求v
function v=Lagrange_2(x,y,u)
    n=length(x);
    L=zeros(n);
    for k=1:n
        r=1;
        for ii=1:n
            if(ii==k)
                continue;
            end
            r=conv(r,poly(x(ii)));
        end
        L(k,:)=y(k).*r./polyval(r,x(k));
    end
    P=sum(L);
    v=polyval(P,u);
end