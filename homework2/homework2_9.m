clear
clc

n=1e5;
A=myFern(n);

scatter(A(:,1),A(:,2),1,'filled')

function A=myFern(n)
    A(1,1)=0;
    A(1,2)=0;
    for i=2:n
        P=rand();
        if(P<=0.01)
            [A(i,1),A(i,2)]=deal(0,0.16*A(i-1,2));
        elseif(P<=0.01+0.07)
            [A(i,1),A(i,2)]=deal(0.2*A(i-1,1)-0.26*A(i-1,2),0.23*A(i-1,1)+0.22*A(i-1,2)+1.6);
        elseif(P<=0.01+0.07+0.07)
            [A(i,1),A(i,2)]=deal(-0.15*A(i-1,1)+0.28*A(i-1,2),0.26*A(i-1,1)+0.24*A(i-1,2)+0.44);
        else
            [A(i,1),A(i,2)]=deal(0.85*A(i-1,1)+0.04*A(i-1,2),-0.04*A(i-1,1)+0.85*A(i-1,2)+1.6);
        end
    end
end
