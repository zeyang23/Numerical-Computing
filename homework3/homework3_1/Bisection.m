function x=Bisection(f,a,b,TOL) % f是函数（使用匿名函数实现较为方便）
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