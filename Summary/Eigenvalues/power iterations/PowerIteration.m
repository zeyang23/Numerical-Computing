function [lam,u]=PowerIteration(A,x,k)
    % Input: matrix A, initial (nonzero) vector x, number of steps k
    % Output: dominant eigenvalue lam, eigenvector u
    for j = 1:k
        u = x / norm(x); % normalize vector
        x = A * u; % power step
        lam = u' * x; % Rayleigh quotient
    end
    u = x / norm(x);
end