% f1和f2是函数句柄 x10和x20是迭代初值
function X = Newton_2d(f1,f2,x10,x20)
    % 将函数句柄转换为符号函数，求解雅可比矩阵
    F1=sym(f1);
    F2=sym(f2);
    v=symvar(F1);
    J=jacobian([F1 F2],[v(1) v(2)]);
    
    x=[];
    x(1,:)=[x10 x20];
    k=1;
    while(1)
        j=double(subs(J,[v(1) v(2)],x(k,:)));
        b=-[f1(x(k,1),x(k,2)) f2(x(k,1),x(k,2))]';
        delta=j\b;
        x(k+1,:)=x(k,:)+delta';
        k=k+1;
        if(norm(x(k,:)-x(k-1,:))<1e-5)
            break;
        end
    end
    X=x(end,:);
end