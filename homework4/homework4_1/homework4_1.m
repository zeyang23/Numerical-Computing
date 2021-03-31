clear
clc
addpath(genpath('.'));
pic=imread('h.jpg');
imshow(pic);
[x0,y0]=ginput; % 取点时遵照顺序
save('raw_data.mat','x0','y0')

% 坐标变换 坐标标准化
[width,height,~]=size(pic);
x=transpose(x0)/width;
y=1-transpose(y0)/height;
[x_min,index_min]=min(x);
x_max=max(x);

%分成两部分处理
x1=x(1:index_min);
y1=y(1:index_min);
u1=linspace(x_min,0.5,1000);
v1=interp1(x1,y1,u1,'spline');

x2=x(index_min:end);
y2=y(index_min:end);
u2=linspace(x_min,0.5,1000);
v2=interp1(x2,y2,u2,'spline');

plot(u1,v1)
hold on
plot(u2,v2)
plot(1-u1,v1)
plot(1-u2,v2)

scatter(x1,y1,8)
scatter(x2,y2,8)
hold off
title('heart')
xlabel('x')
ylabel('y')
axis equal
axis([0 1 0 1])

rmpath(genpath('.'));