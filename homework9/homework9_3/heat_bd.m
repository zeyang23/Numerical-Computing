function [t,x,w]=heat_bd(a,b,h,ts,te,k,D,f,left,right)
    x=a:h:b;
    M=(b-a)/h;
    
    t=ts:k:te;
%     N=(te-ts)/k;
    sigma=D*k/h^2;
    A=diag(1+2*sigma*ones(M-1,1))+diag(-sigma*ones(M-2,1),1)+diag(-sigma*ones(M-2,1),-1);
    
    w(:,1)=f(x);
    for i=2:length(t)
        b=w(2:end-1,i-1)+sigma*[left(t(i));zeros(M-3,1);right(t(i))];
        w(:,i)=[left(t(i));A\b;right(t(i))];
    end
end