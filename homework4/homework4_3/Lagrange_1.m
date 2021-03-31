% ÷±Ω”º∆À„
function v=Lagrange_1(x,y,u)
    n=length(x);
    v=zeros(size(u));
    for k=1:n
        w=ones(size(u));
        for ii=[1:k-1 k+1:n]
            w=w.*(u-x(ii))./(x(k)-x(ii));
        end
        w=w.*y(k);
        v=v+w;
    end
end