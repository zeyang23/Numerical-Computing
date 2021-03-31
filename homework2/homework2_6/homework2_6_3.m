clear

file=fopen('test.txt','r');
A=fscanf(file,'%f');
fclose(file);

tic
A=insert_sort(A');
time_insert=toc

function y=insert_sort(x)
    for i=2:length(x)
        for j=1:i-1
            if x(i)<x(j)
                tmp=x(i);
                for k=i-1:-1:j
                     x(k+1)=x(k);
                end
                x(j)=tmp;
                break
            end
        end
    end
    y=x;
end