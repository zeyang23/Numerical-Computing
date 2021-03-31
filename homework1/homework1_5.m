test=cell(1,3);
test{1,1}='MATLAB';
student=struct('name','张三','score',[85,92,90]);
test{1,2}=student;
A=magic(3);
test{1,3}=A;
disp(test{1,3}(3,:)) %显示矩阵A的第3行