clear
clc

%�����⻯Ϊ��׼��ʽ
c = [3,-2,1,0,0]; 
A=[2 1 -1 1 0;4 3 1 0 -1;-1 1 1 0 0];
b = [5;3;2]; 
lb = zeros(5,1);

tic;
[x_l,f_l,~,output] = linprog(c,[],[],A,b,lb);
% x_l(4:5)=[];
f_l=-f_l;
t1=toc;

tic;
[x_s,f_s,iter] = simplex(A,b,c);
% x_s(4:5)=[];
f_s=-f_s;
t2=toc;


fprintf("linprog�����Ž� %f %f %f \n",x_l(1),x_l(2),x_l(3));
fprintf("linprog������ֵ %f \n",f_l);
fprintf("�������� %d\n",output.iterations);
fprintf("��ʱ %f \n\n",t1);

fprintf("simplex�����Ž� %f %f %f \n",x_s(1),x_s(2),x_s(3));
fprintf("simplex������ֵ %f \n",f_s);
fprintf("�������� %d\n",iter);
fprintf("��ʱ %f \n\n",t2);