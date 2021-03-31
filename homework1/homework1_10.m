clear
[x,y]=meshgrid(-1:0.05:1);
Z=abs(x)+abs(y);
subplot(1,2,1)
mesh(x,y,Z,'FaceColor','r')
xlabel('x')
ylabel('y')
zlabel('z')
title('3D')
axis equal

subplot(1,2,2)
contour(x,y,Z,'Color','r')
xlabel('x')
ylabel('y')
title('2D')
axis equal

