clear
clc

%将问题化为标准形式
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


fprintf("linprog的最优解 %f %f %f \n",x_l(1),x_l(2),x_l(3));
fprintf("linprog的最优值 %f \n",f_l);
fprintf("迭代次数 %d\n",output.iterations);
fprintf("用时 %f \n\n",t1);

fprintf("simplex的最优解 %f %f %f \n",x_s(1),x_s(2),x_s(3));
fprintf("simplex的最优值 %f \n",f_s);
fprintf("迭代次数 %d\n",iter);
fprintf("用时 %f \n\n",t2);