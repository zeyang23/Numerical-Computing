function x=Bisection(f,a,b) % f�Ǻ�����ʹ����������ʵ�ֽ�Ϊ���㣩
    % ����a��b�Ƿ���������
    if(sign(f(a))==sign(f(b)))
        error('wrong input');
    end
    
    TOL=0.5e-8;
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