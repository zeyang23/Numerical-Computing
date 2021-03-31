clear all
clc

% 首先求解1相对于2的运动
% y1=x y2=x' y3=y y4=y' 
f=@(y1,y2,y3,y4) [y2;
                  -12*y1./(y1.^2+y3.^2).^1.5;
                  y4;
                  -12*y3./(y1.^2+y3.^2).^1.5];
              
h=1e-5;
t=0:h:5;
y=[1;0;1;-2];

for i=1:length(t)-1
    y(:,i+1)=y(:,i)+h*RK4(f,y(1,i),y(2,i),y(3,i),y(4,i),h);

%     pic=plot(y(1,:),y(3,:),'-*','MarkerIndices',length(y(1,:)));
%     axis([-0.5 2 -2 12])
%     pause(0.1)
    
end

plot(y(1,:),y(3,:))
xlabel('x')
ylabel('y')
title('1相对于2的运动')

% 将相对运动转换为绝对运动
x1=1/3+2*y(1,:)/3;
x2=1/3-y(1,:)/3;
y1=(t+1)/3+2*y(3,:)/3;
y2=(t+1)/3-y(3,:)/3;
figure
plot(x1,y1)
hold on
plot(x2,y2)
hold off
legend('1','2')
xlabel('x')
ylabel('y')
title('1和2的运动')

function k=RK4(f,y1,y2,y3,y4,h)
    k1=f(y1,y2,y3,y4);
    k2=f(y1+h/2*k1(1),y2+h/2*k1(2),y3+h/2*k1(3),y4+h/2*k1(4));
    k3=f(y1+h/2*k2(1),y2+h/2*k2(2),y3+h/2*k2(3),y4+h/2*k2(4));
    k4=f(y1+h/2*k3(1),y2+h/2*k3(2),y3+h/2*k3(3),y4+h/2*k3(4));
    k=1/6*(k1+2*(k2+k3)+k4);
end