clear
clc

x=transpose(0:15);

y=my_fft(x);

x1=my_ifft(y)/length(y);