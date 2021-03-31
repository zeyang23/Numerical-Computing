function [t,y]=Ex_Trapezoid(f,span,y0,h)
    a=span(1);
    b=span(2);
    t=a:h:b;
    y(:,1)=y0;
    for i=1:length(t)-1
        y(:,i+1)=y(:,i)+h/2*(f(t(i),y(:,i))+f(t(i+1),y(:,i)+h*f(t(i),y(:,i))));
    end
end