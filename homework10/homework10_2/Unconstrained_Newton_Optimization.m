function [f_min,zz,k]=Unconstrained_Newton_Optimization(f,grad_x,grad_y,H_xx,H_xy,H_yx,H_yy,z0,TOL)
    k = 1;
    z(:,1) = z0;
    while true
        g(:,k) = [grad_x(z(1,k),z(2,k));grad_y(z(1,k),z(2,k))];
        
        if(norm(g(:,k))<TOL)
            zz = z(:,k);
            f_min = f(zz(1),zz(2));
            break;
        end
       
        H = zeros(2,2);
        H(1,1) = H_xx(z(1,k),z(2,k));
        H(1,2) = H_xy(z(1,k),z(2,k));
        H(2,1) = H_yx(z(1,k),z(2,k));
        H(2,2) = H_yy(z(1,k),z(2,k));
        
        d_k = - H \ g(:,k);
        
        alpha = 1;
        epsilon = 0.2;
        w = 0.9;
        while true
            z_new = z(:,k) + alpha * d_k;
            z_old = z(:,k);
            if f(z_new(1),z_new(2)) <= f(z_old(1),z_old(2)) + epsilon * alpha * g(:,k)' * d_k
                alpha_k = alpha;
                z(:,k+1) = z(:,k) + alpha_k * d_k;
                k = k+1;
                break;
            end
            alpha = alpha * w;
        end
    end 
    if true
        for i = 1:k-1
            plot3([z(1,i),z(1,i+1)],[z(2,i),z(2,i+1)],[f(z(1,i),z(2,i)),f(z(1,i+1),z(2,i+1))],'g-','LineWidth',2);
        end
    end
end