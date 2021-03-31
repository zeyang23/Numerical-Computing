get_x= @(theta) (2*cos(theta)+1).*cos(theta);
get_y= @(theta) (2*cos(theta)+1).*sin(theta);
x=get_x((0:0.01:2*pi));
y=get_y((0:0.01:2*pi));
plot(x,y)
