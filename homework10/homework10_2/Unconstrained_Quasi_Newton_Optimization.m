function [f_min,zz,k]=Unconstrained_Quasi_Newton_Optimization(f,grad_x,grad_y,z0,TOL)
    k = 1;
    z(:,1) = z0;
    g(:,1) = [grad_x(z(1,k),z(2,k));grad_y(z(1,k),z(2,k))];
    H = eye(2);
    while true
        if(norm(g(:,k))<TOL)
            zz = z(:,k);
            f_min = f(zz(1),zz(2));
            break;
        end
        
        d_k = - H * g(:,k);
        
        alpha = 1;
        epsilon = 0.2;
        w = 0.9;
        while true
            z_new = z(:,k) + alpha * d_k;
            z_old = z(:,k);
            if f(z_new(1),z_new(2)) <= f(z_old(1),z_old(2)) + epsilon * alpha * g(:,k)' * d_k
                break;
            end
            alpha = alpha * w;
        end
        alpha_k = alpha;
        z(:,k+1) = z(:,k) + alpha_k * d_k;
        g(:,k+1) = [grad_x(z(1,k+1),z(2,k+1));grad_y(z(1,k+1),z(2,k+1))];
        s_k = alpha_k * d_k;
        u_k = g(:,k+1) - g(:,k);
        H = H + s_k * s_k' / (s_k' * u_k) - H * u_k * u_k' * H / (u_k' * H * u_k);
        k = k+1;
    end 
    if true
        for i = 1:k-1
            plot3([z(1,i),z(1,i+1)],[z(2,i),z(2,i+1)],[f(z(1,i),z(2,i)),f(z(1,i+1),z(2,i+1))],'b-','LineWidth',2);
        end
    end
end