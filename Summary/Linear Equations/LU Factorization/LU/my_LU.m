function [L,U] = my_LU(A)
    n = length(A);
    L = eye(n);
    U = zeros(n,n);
    for j = 1:n
        for i = j+1:n
            mid = A(i,j)/A(j,j);
            A(i,j:n) = A(i,j:n) - mid*A(j,j:n); 
            L(i,j) = mid;
        end
    end
    U = A;
end