clear
clc
x=0.1:0.1:0.9;
y=[2.3201,2.6470,2.9707,3.2885,3.6008,3.9090,4.2147,4.5191,4.8232];
F=@(c) y-(c(1).*x+c(2).*x.^2.*exp(-c(3).*x)+c(4));

c=[1,1,1,1]; % ��ֵ����Ҫ�����ȡ�Ĳ��ã���ʹ����ⷨ�߷���ʱ��������
k=1;

error=1e-8;

while(1)
    D=zeros(length(x),4);
    for ii=1:length(x)
        D(ii,1)=-x(ii);
        D(ii,2)=-x(ii)^2*exp(-c(k,3)*x(ii));
        D(ii,3)=c(k,2)*x(ii)^3*exp(-c(k,3)*x(ii));
        D(ii,4)=-1;
        % ��ƫ��ʱע����ȷ˭�Ǳ������˴����������
    end
    
    r=zeros(length(x),1);
    for jj=1:length(x)
        r(jj)=y(jj)-c(k,1)*x(jj)-c(k,2)*x(jj)^2*exp(-c(k,3)*x(jj))-c(k,4);
    end
    
    delta=(transpose(D)*D)\(-transpose(D)*r);
    c(k+1,:)=transpose(delta)+c(k,:);
    k=k+1;
    
    if(norm(c(k,:)-c(k-1,:))<error)
        break;
    end
end
c=c(end,:);
fprintf("Gauss-Newton�����\n")
disp(c)
fprintf("RMSE\n")
RMSE_1=norm(F(c))/sqrt(length(x));
disp(RMSE_1)

f_1=@(X) c(1).*X+c(2).*X.^2.*exp(-c(3).*X)+c(4);
figure
u=linspace(0,1,1000);
v=f_1(u);
plot(x,y,'o',u,v)
legend("raw data","�����")
title("Gauss-Newton")

% ʹ�����ú���lsqnonlin�������
clear x y u v f
x=0.1:0.1:0.9;
y=[2.3201,2.6470,2.9707,3.2885,3.6008,3.9090,4.2147,4.5191,4.8232];
c0=[1,1,1,1];
C=lsqnonlin(F,c0);
f_2=@(x) C(1).*x+C(2).*x.^2.*exp(-C(3).*x)+C(4);
u=linspace(0,1,1000);
v=f_2(u);
figure
plot(x,y,'o',u,v)
legend("raw data","�����")
title("lsqnonlin")

fprintf("lsqnonlin�����\n")
disp(C)
fprintf("RMSE\n")
RMSE_2=norm(F(C))/sqrt(length(x));
disp(RMSE_2)
e=norm(C-c);
fprintf("Gatuss-Newton��lsqnonlin�Ľ���Ĳ��\n")
disp(e)