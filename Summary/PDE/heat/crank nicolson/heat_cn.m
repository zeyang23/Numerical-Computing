function [t,x,w]=heat_cn(a,b,h,ts,te,k,D,f,left,right)
    x=a:h:b;
    M=(b-a)/h;
    
    t=ts:k:te;
%     N=(te-ts)/k;
    sigma=D*k/h^2;
    
    A=diag(2+2*sigma*ones(M-1,1))+diag(-sigma*ones(M-2,1),1)+diag(-sigma*ones(M-2,1),-1);
    B=diag(2-2*sigma*ones(M-1,1))+diag(sigma*ones(M-2,1),1)+diag(sigma*ones(M-2,1),-1);
    
    w(:,1)=f(x);
    for i=2:length(t)
        b=B*w(2:end-1,i-1)+sigma*[w(1,i-1);zeros(M-3,1);w(end,i-1)]+sigma*[left(t(i));zeros(M-3,1);right(t(i))];
        w(:,i)=[left(t(i));A\b;right(t(i))];
    end
end