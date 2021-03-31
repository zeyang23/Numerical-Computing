function I = Lagrange_Interpolation(f,lb,ub,n)
    t = linspace(lb,ub,n);
    x = sym('x');
    y = 0;
    for i=1:n
        xp = t([1:i-1 i+1:n]);
        y = y + prod(x-xp)/prod(t(i)-xp)*f(t(i));
    end
    I = int(y,[lb,ub]);
    I=double(I);
end