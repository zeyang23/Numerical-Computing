function [lam,u] = InversePowerIteration(A,x,s,k)
    for j = 1:k
        u = x / norm(x); % normalize vector
        x = (A-s*eye(length(x))) \ u; % power step
        lam = u' * x; % Rayleigh quotient
    end
    u = x / norm(x);
end