function X=FixedPoint(g,x0,TOL)
    % g�ǹ����g(x)�ĺ���������������������
    % x0�ǵ�����ֵ
    
    x(1)=x0;
    k=1;
    while(1)
        x(k+1)=g(x(k));
        k=k+1;
        if(abs(x(k)-x(k-1))<TOL)
            break
        end
    end
    X=x(end);
end
