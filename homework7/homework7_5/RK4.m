function k=RK4(f,x1,x2,h)
    k1=f(x1,x2);
    k2=f(x1+h/2*k1(1),x2+h/2*k1(2));
    k3=f(x1+h/2*k2(1),x2+h/2*k2(2));
    k4=f(x1+h*k3(1),x2+h*k3(2));
    k=1/6*(k1+2*(k2+k3)+k4);
end