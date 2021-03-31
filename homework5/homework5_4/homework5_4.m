clear
clc
addpath(genpath('.'))
% ��1�� ʹ��QR_Houref���� ������qr������
fprintf("��1�� ʹ��QR_Houref���� ������qr������\n")
A=[1,-4;2,3;2,2];
fprintf("QR_Houref\n")
[Q,R]=QR_Houref(A)
fprintf("built-in qr\n")
[q,r]=qr(A)
fprintf("������\n")
err_q=norm(Q-q)
err_r=norm(R-r)

% ��2�� ��С��������
fprintf("��2�� ��С��������\n")
M=[3,-1,2;4,1,0;-3,2,1;1,1,5;-2,0,3];
B=[10;10;-5;15;0];
[m,n]=size(M);
[QM,RM]=QR_Houref(M);
B=transpose(QM)*B;
x=RM(1:n,:)\B(1:n);
fprintf("�����\n")
disp(x)

norm_r=norm(B(n+1:end));
se=norm_r^2;
rmse=norm_r/sqrt(length(M));
fprintf("�в�\n")
fprintf("2_norm\n")
disp(norm_r)
fprintf("SE\n")
disp(se)
fprintf("RMSE\n")
disp(rmse)
rmpath(genpath('.'))