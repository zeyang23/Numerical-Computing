f=@(x,y) (x.^2 + y.^2 - 1)^3-x.^2*y.^3;
fimplicit(f,[-1.5 1.5 -1.5 1.5])
xlabel('x')
ylabel('y')
title('heart2')
axis equal