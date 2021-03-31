clear all
clc
addpath(genpath('.'));
load("data")
f=@(a,b,c,d) y-(a.*sin(b.*x)+c.*cos(d.*x));
F=sym(f);
J=jacobian(F);

% a b c d ³õÊ¼Öµ
C=[5,1,10,2];
e=1.95;
C=C+e;
lamda=0.01;
TOL=1e-6;
a0=C(1,1);
b0=C(1,2);
c0=C(1,3);
d0=C(1,4);
r0_norm=norm(f(a0,b0,c0,d0));

k=1;
while(1)
    if(k>=1000)
        error("diverge");
    end
    
    j=double(subs(J,symvar(J),C(k,:)));
    a1=C(k,1);
    b1=C(k,2);
    c1=C(k,3);
    d1=C(k,4);
    delta=(transpose(j)*j+lamda*diag(transpose(j)*j))\(-transpose(j)*f(a1,b1,c1,d1));
    C(k+1,:)=transpose(delta)+C(k,:);
    
    a2=C(k+1,1);
    b2=C(k+1,2);
    c2=C(k+1,3);
    d2=C(k+1,4);
    
    if(norm(f(a2,b2,c2,d2))<norm(f(a1,b1,c1,d1)))
        k=k+1;
        lamda=lamda/10;
    else
        C(k+1,:)=[];
        lamda=lamda*10;
        continue
    end
    
    if(norm(C(k,:)-C(k-1,:))<TOL)
        break
    end
end

disp(C(end,:))
a=C(end,1);
b=C(end,2);
c=C(end,3);
d=C(end,4);
u=linspace(0,1,1000);
fun=@(x) a.*sin(b.*x)+c.*cos(d.*x);
v=fun(u);
plot(x,y,'o',u,v,'MarkerSize',4)
r_norm=norm(f(a,b,c,d));
% disp(r0_norm)
disp(r_norm)
rmpath(genpath('.'));