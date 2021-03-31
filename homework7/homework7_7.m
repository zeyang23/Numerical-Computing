clear
clc

f=@(x1,x2) [((1-x1).*sin(x1)+x2.*cos(x2))./((sin(x1)).^2+(cos(x2)).^2);
            (((1-x1).*cos(x2))-x2.*sin(x1))./((sin(x1)).^2+(cos(x2)).^2)];
h=1;
y=[0;0];

TOL=1e-5;

T(1)=0;
i=1;
while (T<50)
    
    y1=y(:,i)+h*RK4(f,y(1,i),y(2,i),h);
    y2=y(:,i)+h/2*RK4(f,y(1,i),y(2,i),h/2);
    y3=y2+h/2*RK4(f,y2(1),y2(2),h/2);
        if(norm(y1-y3)>=TOL)
        % 如果超出误差限，减小步长至满足误差限为止
            while(norm(y1-y3)>=TOL)
                h=h/2;
                y1=y(:,i)+h*RK4(f,y(1,i),y(2,i),h);
                y2=y(:,i)+h/2*RK4(f,y(1,i),y(2,i),h/2);
                y3=y2+h/2*RK4(f,y2(1),y2(2),h/2);
            end
        else
        % 如果满足误差限，增大步长至刚好不满足误差限，然后将步长除以2
            while(norm(y1-y3)<TOL)
                h=h*2;
                y1=y(:,i)+h*RK4(f,y(1,i),y(2,i),h);
                y2=y(:,i)+h/2*RK4(f,y(1,i),y(2,i),h/2);
                y3=y2+h/2*RK4(f,y2(1),y2(2),h/2);
            end
            h=h/2;
        end
    y(:,i+1)=y(:,i)+h*RK4(f,y(1,i),y(2,i),h);
    T(i+1)=T(i)+h;
    i=i+1;
end

figure
plot(T,y(1,:))
hold on
plot(T,y(2,:))
legend('x1','x2')
xlabel('t')
ylabel('x')
title('初始h=1 变步长')
hold off

% 第5题中的做法，定步长
f=@(x1,x2) [((1-x1).*sin(x1)+x2.*cos(x2))./((sin(x1)).^2+(cos(x2)).^2);
            ((1-x1).*cos(x2))./((sin(x1)).^2+(cos(x2)).^2)];
h=1;
t=0:h:50;
y=[0;0];

for i=1:length(t)-1
    y(:,i+1)=y(:,i)+h*RK4(f,y(1,i),y(2,i),h);
end

figure
plot(t,y(1,:))
hold on
plot(t,y(2,:))
legend('x1','x2')
xlabel('t')
ylabel('x')
title('初始h=1 定步长')
hold off

function k=RK4(f,x1,x2,h)
    k1=f(x1,x2);
    k2=f(x1+h/2*k1(1),x2+h/2*k1(2));
    k3=f(x1+h/2*k2(1),x2+h/2*k2(2));
    k4=f(x1+h*k3(1),x2+h*k3(2));
    k=1/6*(k1+2*(k2+k3)+k4);
end