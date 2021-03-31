function [t,y]=fdm_linear(k1,k2,k3,a,b,ya,yb,h)

    t=a:h:b;
    n=length(t)-2;
    
    v1=(2-k3*h)*ones(n-1,1);
    v2=(-4-2*h^2*k2)*ones(n,1);
    v3=(2+k3*h)*ones(n-1,1);
    
    A=diag(v1,1)+diag(v2)+diag(v3,-1);
    
    b=zeros(n,1);
    b(1)=2*h^2*k1*t(2)-(2+k3*h)*ya;
    b(n)=2*h^2*k1*t(end-1)-(2-k3*h)*yb;
    
    for i=2:n-1
        b(i)=2*h^2*k1*t(i+1);
    end
    
    y=A\b;
    y=[ya;y;yb]';
end    