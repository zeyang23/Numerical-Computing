function I = Composite_Midpoint(f,a,b,m)
h = (b-a)/m;
I = 0;
x = linspace(a,b,m+1);
for i = 1:m
    I = I + f((x(i)+x(i+1))/2)*h;
end
end
