function yh = DFT_Interpolation (x,y,xh)
    n = length(x);
    p = length(xh);
    yh = zeros(1,p); 
    delta_t = (x(end)-x(1)) / (n-1);
    c = x(1);
    d = x(end)+ delta_t;
    
    [z,F] = DFT_Matrix(y');
    a = real(z);
    b = imag(z);
    
    for i=1:p
        for k=1:n/2-1
%             yh(i) = yh(i) + z(k) * exp(2*pi*1i*(k-1)*(xh(i)-c/(d-c)))/sqrt(n);
%             yh(i) = yh(i) + a(k) * cos(2*pi*(k-1)*(xh(i)-c)/(d-c)) - b(k) * sin(2*pi*(k-1)*(xh(i)-c)/(d-c));
            yh(i) = yh(i) + 2 * (a(k+1) * cos(2*pi*k*(xh(i)-c)/(d-c)) - b(k+1) * sin(2*pi*k*(xh(i)-c)/(d-c)));
        end
        yh(i) = yh(i) + a(1) + a(n/2+1)*cos(n*pi*(xh(i)-c)/(d-c));
        yh(i) = yh(i) / sqrt(n);
    end
%     yh = real(yh);
end

function [y,F] = DFT_Matrix(x)

    n = length(x);
    omega = exp(-2*pi*1i/n); 
    j = 0:n-1; 
    k = j'; 
    F = 1/sqrt(n) * omega.^(k*j);
    y = F * x;
end