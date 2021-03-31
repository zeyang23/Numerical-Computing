function [iy,IF] = Inverse_DFT_Matrix(x)

    n = length(x);
    omega = exp(-2*pi*1i/n); 
    j = 0:1:n-1; 
    k = j'; 
    IF = 1/sqrt(n) * omega.^(-k*j);
    iy = IF * x;
end