clear
clc
A=10000*rand(10000,1);
file=fopen('test.txt','w');
for i=1:length(A)
    fprintf(file,"%d\n",A(i));
end
fclose(file);