function [f_min,zz,k] = Steepest_Descent(f,grad,z0,TOL)
    z(:,1) = z0;
    g(:,1) = grad(z0);
    k = 1;
    alpha_0 = 1;
    epsilon = 0.2;
    w = 0.5;
    
    while true
        if(norm(g(:,k)) < TOL)
            zz = z(:,k);
            f_min = f(zz);
            break;
        end
        alpha = alpha_0;
        while true
            d_k = -g(:,k);
            z(:,k+1) = z(:,k) + alpha * d_k;
            
            if f(z(:,k+1)) <= f(z(:,k)) + epsilon * alpha * g(:,k)' * d_k
                g(:,k+1) = grad(z(:,k+1));
                break;
            end
            alpha = alpha * w;
        end
        k = k + 1;
    end
%     if true
%         for i = 1:k-1
%             plot3([z(1,i),z(1,i+1)],[z(2,i),z(2,i+1)],[f(z(1,i),z(2,i)),f(z(1,i+1),z(2,i+1))],'r-','LineWidth',2);
%         end
%     end
end