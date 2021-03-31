clear
clc

f = @(x,y) exp(-x.*y);

h1 = 1e-3;
h2 = 1e-3;

x = linspace(0,1,1/h1+1);
y = linspace(0,1,1/h2+1);
m = length(x);
n = length(y);

A = zeros(m-1,n-1);
for i = 1:m-1
    for j = 1:n-1
        A(i,j) = f(x(i),y(j))+f(x(i+1),y(j))+f(x(i),y(j+1))+f(x(i+1),y(j+1))+...
        4*f((x(i)+x(i+1))/2 ,y(j)) +...
        4*f(x(i),(y(j)+y(j+1))/2)   +...
        4*f(x(i+1),(y(j)+y(j+1))/2) +...
        4*f((x(i)+x(i+1))/2 ,y(j+1))+...
        16*f((x(i+1)+x(i))/2,(y(j)+y(j+1))/2);
    end
end

format
fprintf('h1\n')
disp(h1)
fprintf('h2\n')
disp(h2)
I = h1*h2/36*(sum(sum(A)));
format long
fprintf('I\n')
disp(I)