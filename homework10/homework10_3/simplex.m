function [x,f,iter]=simplex(A,b,c)
    % A为整理好的矩阵 b为列向量 c为行向量
    [m,n]=size(A);
    
    iter=0;
    x=zeros(1,m);
    A=[A eye(m) b];
    
    c=[c zeros(1,m+1)]; 
    
    while ~all(c(1:length(c)-1)>=0)
        index=find(c<0);
        e=find(A(:,index(1))>0);
        g=[];
        
        for i=1:length(e)
            g=[g A(e(i),n+m+1)/A(e(i),index(1))];
        end
        
        h=find(g==min(g));
        p=A(e(h),index(1));
        
        for i=1:n+m+1
            A(e(h),i)=A(e(h),i)/p;
        end
        
        j=-c(index(1))/A(e(h),index(1));
        
        for i=1:n+m+1
            c(i)=j*A(e(h),i)+c(i);
        end
        
        for i=1:m
            if i==e(h)
                continue
            end
            j=-A(i,index(1))/A(e(h),index(1));
            for k=1:n+m+1
                A(i,k)=j*A(e(h),k)+A(i,k);
            end    
        end
        
        iter=iter+1;
    end
    
    o=[];
    
    for i=1:n
        if all(A(:,i)>=0) && sum(A(:,i))==1
            o=[o i];
        end
    end
    
    for i=1:length(o)
        for k=1:m
            if A(k,o(i))==1
                x(o(i))=A(k,n+m+1);
            end
        end
    end
    
    x=x(:);
    f=-c(n+m+1);
end