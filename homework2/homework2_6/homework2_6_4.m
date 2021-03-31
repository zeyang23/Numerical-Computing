clear

file=fopen('test.txt','r');
A=fscanf(file,'%f');
fclose(file);

tic
A=sort(A');
time_sort=toc