% 针对特定函数，利用数组的思想，程序很简洁。
clear
clc

x=[-1,0,1,2];
y=[13.45,3.01,0.67,0.15];
fun=@(C) y-C(1).*exp(C(2).*x);
C=[1,1];
k=1;
while(1)
    J(:,1)=-exp(C(k,2).*x);
    J(:,2)=-C(k,1).*x.*exp(C(k,2).*x);
    delta=(transpose(J)*J)\-(transpose(J)*transpose(fun(C(k,:))));
    C(k+1,:)=C(k,:)+transpose(delta);
    k=k+1;
    if(norm(C(k,:)-C(k-1,:))<1e-6)
        break
    end
end
C(end,:)