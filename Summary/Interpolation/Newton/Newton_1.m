% ֱ�Ӽ���
function v=Newton_1(x,y,u)
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
    % disp(f)
    % F������ţ�ٲ��̣�ÿһ���ϵ����
    F=diag(f);

    m=size(u);
    v=F(n)*ones(m);
    for kk=1:n-1
        v=v.*(u-x(n-kk))+F(n-kk);
    end
end