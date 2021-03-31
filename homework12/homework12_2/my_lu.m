function [L,U,P]=my_lu(A)
    n=length(A);
    P=eye(n);
    L=eye(n);
    
    for k=1:n
        [~,index]=max(A(k:end,k));
        % max�������ص����������е�������Ҫ�õ�������A�е��кţ���Ҫ��k-1;
        index=index+k-1;
        A([k,index],:)=A([index,k],:);
        P([k,index],:)=P([index,k],:);
        
        for i=k+1:n
            temp=A(i,k)/A(k,k);
            L(i,k)=temp;
            A(i,:)=A(i,:)-temp*A(k,:);
            
        end
    end
    U=A;
end