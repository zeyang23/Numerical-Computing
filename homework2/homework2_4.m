clear
clc

a=1987987334539888;
b=1287981729848709;

%初始化三种方法所用时间
time=0;
time1=0;
time2=0;

%依次执行三种方法并计时
tic
gcd1(a,b);
time1=toc;
tic
gcd2(a,b);
time2=toc;
tic
gcd(a,b);
time=toc;

fprintf("辗转相除\n")
fprintf("与标准函数gcd的时间比为 %d\n",time1/time)
fprintf("更相减损\n")
fprintf("与标准函数gcd的时间比为 %d\n",time2/time)

%更相减损
function x=gcd2(a,b)
    counter=0; %记录两数同时除以2的次数
    %如果a和b同时为偶数，将两数同时除以2
    while(1)
        while(mod(a,2)==0 && mod(b,2)==0)
            a=a/2;
            b=b/2;
            counter=counter+1;
        end
    
        if(a==b)
            break;
        end
    
        [a,b]=change(a,b);
        [a,b]=deal(a-b,b);
        [a,b]=change(a,b);
    
        if(a==b)
            break;
        end
    end
    x=2^counter*a;
end

%辗转相除
function x=gcd1(a,b)
    while(1)
        [a,b]=change(a,b);
        c=mod(a,b);
        [a,b]=deal(b,c);
        if(b==0)
            break;
        end
    end
    x=a;
end

%排序a和b 大数在前，小数在后
function [x,y] = change (a,b)
    if(a>=b)
        x=a;
        y=b;
    else
        x=b;
        y=a;
    end
end