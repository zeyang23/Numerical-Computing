clear
clc

F = @(x) 2*x(1).^2-4*x(1).*x(2)+4*x(2).^2-6*x(1)-3*x(2);
A = [1,1;4,1];
b = [3;9];

x10 = [2,2];
tic;
[x1,f1,~,output1] = fmincon(F,x10,A,b,[],[],[0,0]);
t1=toc;


x20 = [1e5,1e5];
tic;
[x2,f2,~,output2] = fmincon(F,x20,A,b,[],[],[0,0]);
t2=toc;


x30 = [1e10,1e10];
tic;
[x3,f3,~,output3] = fmincon(F,x30,A,b,[],[],[0,0]);
t3=toc;

tic;
[x4,f4,~,output4] = ga(F,2,A,b,[],[],[0,0],[]);
t4=toc;

tic;
[x5,f5,~,output5] = ga(F,2,A,b,[],[],[0,0],[]);
t5=toc;

fprintf("\n")
fprintf("第1次执行ga\n")
fprintf("ga的最优解 %f %f \n",x4(1),x4(2));
fprintf("ga的最优值 %f \n",f3);
fprintf("generations %d\n", output4.generations);
fprintf("用时 %f \n\n",t4);

fprintf("第2次执行ga\n")
fprintf("ga的最优解 %f %f \n",x5(1),x5(2));
fprintf("ga的最优值 %f \n",f5);
fprintf("generations %d\n", output5.generations);
fprintf("用时 %f \n\n",t5);

fprintf("初值 %f %f \n",x10(1),x10(2));
fprintf("fmincon的最优解 %f %f \n",x1(1),x1(2));
fprintf("fmincon的最优值 %f \n",f1);
fprintf("迭代次数 %d\n", output1.iterations);
fprintf("用时 %f \n\n",t1);

fprintf("初值 %f %f \n",x20(1),x20(2));
fprintf("fmincon的最优解 %f %f \n",x2(1),x2(2));
fprintf("fmincon的最优值 %f \n",f2);
fprintf("迭代次数 %d\n", output2.iterations);
fprintf("用时 %f \n\n",t2);

fprintf("初值 %f %f \n",x30(1),x30(2));
fprintf("fmincon的最优解 %f %f \n",x3(1),x3(2));
fprintf("fmincon的最优值 %f \n",f3);
fprintf("迭代次数 %d\n", output3.iterations);
fprintf("用时 %f \n\n",t3);