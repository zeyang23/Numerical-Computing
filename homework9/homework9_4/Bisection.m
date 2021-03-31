function x=Bisection(f,a,b,TOL) 
    % f是函数句柄，最好是匿名函数
    % a是区间左端，b是区间右端
    % TOL=0.5e-p 精确到小数点后p位
    
    % 检验a和b是否满足条件
    if(sign(f(a))==sign(f(b)))
        error('wrong input');
    end
    
    while (b-a)/2 > TOL
        c=(a+b)/2;
        fc=f(c);
        if(fc==0)
            break;
        end
        if sign(fc)==sign(f(b))
            b=c;
        else
            a=c;
        end
    end
    x=(a+b)/2;
end