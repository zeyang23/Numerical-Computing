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
disp('myfft ��ʱ')
disp(t1)
disp('fft')
disp(Y)
disp('fft ��ʱ')
disp(t2)

disp('����ƫ��')
disp(norm(y-Y))