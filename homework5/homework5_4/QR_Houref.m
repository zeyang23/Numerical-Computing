function [Q,R] = QR_Houref(A)
    [m,n]=size(A);
    Q=eye(m);

    for k=1:n
        x=transpose(A(k:end,k));
        
        % ���A�Ƿ�����ô���һ��ִ��ѭ����ʱx��һά�ģ������κβ���,ֱ�ӽ���ѭ��
        if(numel(x)==1)
            break
        end
        
        w=[-sign(x(1))*norm(x),zeros(1,length(x)-1)];
        v=w-x;
        P=(transpose(v)*v)/(v*transpose(v));
        
        H=eye(length(x))-2*P;
        H=[eye(m-length(x)),zeros(m-length(x),length(x));
           zeros(length(x),m-length(x)),H];
   
        A=H*A;
        Q=Q*H;
    end
    R=A;
end