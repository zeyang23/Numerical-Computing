clear
clc

a=1987987334539888;
b=1287981729848709;

%��ʼ�����ַ�������ʱ��
time=0;
time1=0;
time2=0;

%����ִ�����ַ�������ʱ
tic
gcd1(a,b);
time1=toc;
tic
gcd2(a,b);
time2=toc;
tic
gcd(a,b);
time=toc;

fprintf("շת���\n")
fprintf("���׼����gcd��ʱ���Ϊ %d\n",time1/time)
fprintf("�������\n")
fprintf("���׼����gcd��ʱ���Ϊ %d\n",time2/time)

%�������
function x=gcd2(a,b)
    counter=0; %��¼����ͬʱ����2�Ĵ���
    %���a��bͬʱΪż����������ͬʱ����2
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

%շת���
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

%����a��b ������ǰ��С���ں�
function [x,y] = change (a,b)
    if(a>=b)
        x=a;
        y=b;
    else
        x=b;
        y=a;
    end
end