function [L,U,P]=my_lu(A)
    n=length(A);
    P=eye(n);
    L=eye(n);
    
    for k=1:n
        [~,index]=max(A(k:end,k));
        % max函数返回的是子数组中的索引，要得到在整个A中的行号，需要加k-1;
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