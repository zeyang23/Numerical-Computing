function [f_min,zz,k]=Quasi_Newton(f,grad,z0,TOL)
    k = 1;
    z(:,1) = z0;
    g(:,1) = grad(z(:,1));
    H = eye(length(z0));
    
    while true
        g(:,k) = grad(z(:,k));
        
        if(norm(g(:,k))<TOL)
            zz = z(:,k);
            f_min = f(zz);
            break;
        end
        
        d_k = - H * g(:,k);
        
        alpha = 1;
        epsilon = 0.2;
        w = 0.9;
        
        while true
            z(:,k+1) = z(:,k) + alpha * d_k;

            if f(z(:,k+1)) <= f(z(:,k)) + epsilon * alpha * g(:,k)' * d_k
                break;
            end
            alpha = alpha * w;
        end
        
        g(:,k+1) = grad(z(:,k+1));
        
        s_k = alpha * d_k;
        u_k = g(:,k+1) - g(:,k);
        H = H + s_k * s_k' / (s_k' * u_k) - H * u_k * u_k' * H / (u_k' * H * u_k);
        
        k = k+1;
    end 
%     if true
%         for i = 1:k-1
%             plot3([z(1,i),z(1,i+1)],[z(2,i),z(2,i+1)],[f(z(1,i),z(2,i)),f(z(1,i+1),z(2,i+1))],'b-','LineWidth',2);
%         end
%     end
end