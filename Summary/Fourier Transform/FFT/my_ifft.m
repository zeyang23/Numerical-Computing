function y = my_ifft(x) 
    n = length(x);
    
    omega = exp(2*pi*1i/n); 
    
    if(n == 2)
%         F = omega.^[0 0;0 1];
%         y = F * x;
        y = omega.^[0 0;0 1] * x;
    else
        x1 = x(1:2:end);
        x2 = x(2:2:end);
        u = my_ifft(x1);
        v = my_ifft(x2);
        y = [u;u] + (omega.^transpose((0:n-1))) .* [v;v];
%         y = [FFT(x(1:2:end));FFT(x(1:2:end))] ...
%             + diag(omega.^(0:n-1)') * [FFT(x(2:2:end));FFT(x(2:2:end))];
    end
    
end