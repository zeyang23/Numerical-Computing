function k=RK4(f,ti,wi,h)
    k1=f(ti,wi);
    k2=f(ti+h/2,wi+h/2*k1);
    k3=f(ti+h/2,wi+h/2*k2);
    k4=f(ti+h,wi+h*k3);
    k=1/6*(k1+2*(k2+k3)+k4);
end