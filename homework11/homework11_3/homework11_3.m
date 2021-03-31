clear
clc

x=transpose(0:15);
tic;
y=myfft(x);
t1=toc;

tic;
Y=fft(x);
t2=toc;

disp('myfft')
disp(y)
disp('myfft 用时')
disp(t1)
disp('fft')
disp(Y)
disp('fft 用时')
disp(t2)

disp('两者偏差')
disp(norm(y-Y))