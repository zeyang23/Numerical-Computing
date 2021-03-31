function [t,y]=Im_Trapezoid(f,span,y0,h)
    a=span(1);
    b=span(2);
    t=a:h:b;
    y(:,1)=y0;
    for i=1:length(t)-1
        fun=@(w) y(:,i)+h/2*(f(t(i),y(:,i))+f(t(i+1),w))-w;
        opt=optimset('Display','off');
        y(:,i+1)=fsolve(fun,y(:,i),opt);
    end
end