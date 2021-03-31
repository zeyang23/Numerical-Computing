function [t,x,w]=heat_fd(a,b,h,ts,te,k,D,f,left,right)
    x=a:h:b;
    M=(b-a)/h;
    
    t=ts:k:te;
%     N=(te-ts)/k;
    sigma=D*k/h^2;
    A=diag(1-2*sigma*ones(M-1,1))+diag(sigma*ones(M-2,1),1)+diag(sigma*ones(M-2,1),-1);
    
    w(:,1)=f(x);
    for i=2:length(t)
        s=[w(1,i-1);zeros(M-3,1);w(end,i-1)];
        w(:,i)=[left(t(i));A*w(2:end-1,i-1)+sigma.*s;right(t(i))];
    end
end