clear all
clc
addpath(genpath('.'));

% 第1题
fprintf("代入pi/4和-pi/4\n")
disp(f(pi/4))
disp(f(-pi/4))

% 第2题
theta=-pi:0.01:pi;
out=f(theta);

figure
plot(theta,out)
hold on
zero=zeros(length(theta)); % 作辅助线y=0 便于观察
plot(theta,zero)
hold off

% 第3题
figure
subplot(1,2,1)
plot([1 2 2 1],[2 1 3 2],'r')
hold on
plot([0 4 0],[0 0 4],'bo')
plot([0 1],[0,2],'b',[4 2],[0 1],'b',[0 2],[4,3],'b')
axis equal
grid on
hold off
subplot(1,2,2)
plot([2 3 1 2],[1 2 2 1],'r')
hold on
plot([0 4 0],[0 0 4],'bo')
plot([0 2],[0,1],'b',[4 3],[0,2],'b',[0 1],[4 2],'b')
axis equal
grid on
hold off

% 第4题
out_new=f_new(theta);
figure
plot(theta,out_new)
hold on
zero=zeros(length(theta)); % 作辅助线y=0 便于观察
plot(theta,zero)
hold off

% 根据观察，放大图像，得到迭代初值
figure
plot(theta,out_new)
hold on
zero=zeros(length(theta)); % 作辅助线y=0 便于观察
plot(theta,zero)
hold off
xlim([-1 2.5])

% 二分法求解4个根
F_new=@(x) f_new(x); % 创建函数句柄
x=[];
x(1)=Bisection(F_new,-1,-0.5);
x(2)=Bisection(F_new,-0.5,0);
x(3)=Bisection(F_new,1,1.5);
x(4)=Bisection(F_new,2,2.5);

fprintf("theta\n")
disp(x)

% 画出4个位置，同时验证每个位置下的杆长
figure % 新建图窗
p=zeros(4,3); % 记录杆长
for ii=1:4
    theta=x(ii);
    
    % 更新参数
    L1=3; L2=3*sqrt(2); L3=3;
    gamma=pi/4;
    p1=5; p2=5; p3=3;
    x1=5; x2=0; y2=6;
    
    % 中间变量
    A2=L3*cos(theta)-x1;
    B2=L3*sin(theta);
    A3=L2*cos(theta+gamma)-x2;
    B3=L2*sin(theta+gamma)-y2;
    N1=B3.*(p2^2-p1^2-A2.^2-B2.^2)-B2.*(p3^2-p1^2-A3.^2-B3.^2);
    N2=-1*A3.*(p2^2-p1^2-A2.^2-B2.^2)+A2.*(p3^2-p1^2-A3.^2-B3.^2);
    D=2*(A2.*B3-B2.*A3);
    
    % 坐标
    u1=N1./D;
    v1=N2./D;
    u2=u1+L2*cos(theta+gamma);
    v2=v1+L2*sin(theta+gamma);
    u3=u1+L3*cos(theta);
    v3=v1+L3*sin(theta);
    
    % 计算杆长
    p(ii,:)=[sqrt(u1^2+v1^2) sqrt((u1+A2)^2+(v1+B2)^2) sqrt((u1+A3)^2+(v1+B3)^2)];
    
    % 画出位姿
    subplot(2,2,ii)
    plot([u1 u2 u3 u1],[v1 v2 v3 v1],'r');
    hold on
    plot([0 x1 x2],[0 0 y2],'bo')
    plot([0 u1],[0 v1],'b',[x1 u2],[0 v2],'b',[x2 u3],[y2 v3],'b');
    axis equal
    grid on
    hold off
end

fprintf("4个姿态的杆长\n")
disp(p)
% 将求得的杆长与设定值比较
p0=5*ones(4,2);
p0(:,3)=3*ones(4,1);
check=norm(p0-p);
fprintf("杆长总误差\n")
disp(check)

rmpath(genpath('.'));