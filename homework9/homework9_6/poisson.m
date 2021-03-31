function [x,y,w]=poisson(xl,xr,h,yl,yh,k,f,g1,g2,g3,g4)
    x=xl:h:xr;
    M=(xr-xl)/h;
    m=M+1;
    
    y=yl:k:yh;
    N=(yh-yl)/k;
    n=N+1;
    
    A=zeros(m*n);
    b=zeros(m*n,1);
    
    for i=2:m-1
        for j=2:n-1
            A(i+(j-1)*m,i+(j-1)*m)=-2*(1/h^2+1/k^2);
            A(i+(j-1)*m,i+1+(j-1)*m)=1/h^2;
            A(i+(j-1)*m,i-1+(j-1)*m)=1/h^2;
            A(i+(j-1)*m,i+j*m)=1/k^2;
            A(i+(j-1)*m,i+(j-2)*m)=1/k^2;
            b(i+(j-1)*m)=f(x(i),y(j));
        end
    end
    
    for i=1:m
        A(i,i)=1;
        A(i+(n-1)*m,i+(n-1)*m)=1;
        b(i)=g1(x(i));
        b(i+(n-1)*m)=g2(x(i));
    end
    
    for j=2:n-1
        A(1+(j-1)*m,1+(j-1)*m)=1;
        A(m+(j-1)*m,m+(j-1)*m)=1;
        b(1+(j-1)*m)=g3(y(j));
        b(m+(j-1)*m)=g4(y(j));
    end
    
    v=A\b;
    w=reshape(v,m,n);
end