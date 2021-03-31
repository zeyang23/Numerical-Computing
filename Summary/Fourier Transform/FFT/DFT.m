function [y,F] = DFT(x)
    % xΪ������
    n = length(x);
    omega = exp(-2*pi*1i/n); 
    j = 0:n-1; 
    k = j'; 
    F = 1/sqrt(n) * omega.^(k*j);
    y = F * x;
end