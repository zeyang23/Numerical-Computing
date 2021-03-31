clear

file=fopen('test.txt','r');
A=fscanf(file,'%f');
fclose(file);

tic
A=bubble_sort(A');
time_bubble=toc

function y=bubble_sort(x)
    x_len=length(x);
    for i=1:x_len-1
        for j=1:x_len-i
            if(x(j)>x(j+1))
                [x(j),x(j+1)]=swap(x(j),x(j+1));
            end
        end
    end
    y=x;
end

function [a,b]=swap(x,y)
    a=y;
    b=x;
end