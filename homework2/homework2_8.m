clear
clc

format long;

x=(1+5^0.5)/2
n=10;

x1=goldratio_1(n)
x2=goldratio_2(n)

function A=Fib_Generator(n)
    A=[];
    if(n==1)
        A(1)=1;
    elseif(n==2)
        A(1)=1;
        A(2)=1;
    else
        A(1)=1;
        A(2)=1;
        for i=3:n
            A(i)=A(i-1)+A(i-2);
        end
    end
end

function x=goldratio_1(n)
    A=Fib_Generator(n+1);
    x=A(n+1)/A(n);
end

function x=goldratio_2(n)
    A=[];
    if(n==1)
        A(1)=1;
    else
        A(1)=1;
        for i=2:n
            A(i)=1+1/A(i-1);
        end
    end
    x=A(n);
end
    

    