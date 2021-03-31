clear all
clc

xA=[];
f1=@(x) [sqrt(2*x(2)/5) 0.25*(sin(x(1))+cos(x(2)))];
xA(1,:)=[0.2 0.2];
ii=1;
while(1)
    xA(ii+1,:)=f1(xA(ii,:));
    ii=ii+1;
    if(norm(xA(ii,:)-xA(ii-1,:))<1e-6)
        break
    end
end
xA(end,:)

xB=[];
f2=@(x) [-sqrt(2*x(2)/5) 0.25*(sin(x(1))+cos(x(2)))];
xB(1,:)=[-0.2 0.2];
jj=1;
while(1)
    xB(jj+1,:)=f2(xB(jj,:));
    jj=jj+1;
    if(norm(xB(jj,:)-xB(jj-1,:))<1e-6)
        break
    end
end
xB(end,:)