function [t,x,w]=wave(a,b,h,ts,te,k,c,f,g,left,right)
    x=a:h:b;
    M=(b-a)/h;
    
    t=ts:k:te;
%     N=(te-ts)/k;
    sigma=c*k/h;
    
    A=diag(2-2*sigma^2*ones(M-1,1))+diag(sigma^2*ones(M-2,1),1)+diag(sigma^2*ones(M-2,1),-1);
    
    w(:,1)=f(x);
    temp=1/2*A*w(2:end-1,1)+k*g(transpose(x(2:end-1)))+1/2*sigma^2*[left(t(1));zeros(M-3,1);right(t(1))];
    w(:,2)=[left(t(2));temp;right(t(2))];
    
    for i=2:length(t)-1
        temp=A*w(2:end-1,i)-w(2:end-1,i-1)+sigma^2*[left(t(i));zeros(M-3,1);right(t(i))];
        w(:,i+1)=[left(t(i+1));temp;right(t(i+1))];
    end
end