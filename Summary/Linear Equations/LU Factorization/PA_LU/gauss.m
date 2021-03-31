function x=gauss(A,b)
    n=length(A);    
    if(rank(A)<n)
        error("singularity")
    end
    
    A_add=[A,b];  
    for k=1:n
        if(A_add(k,k)==0)
            for(i=k+1:n)
                if(A_add(k,i)~=0)
                    A_add([k,i],:)=A_add([i,k],:);
                    break;
                end
            end
        end
        
        for j=k+1:n
            A_add(j,:)=A_add(j,:)-(A_add(j,k)/A_add(k,k))*A_add(k,:);
        end
    end
    
    x=zeros(n,1);
    for i=n:-1:1
        x(i)=(A_add(i,end)-dot(A_add(i,i+1:n),x(i+1:n,end)))/A_add(i,i);
    end
end