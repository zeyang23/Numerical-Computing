clear
clc


A=[7 5 4;7 6 1; 7 3 7;5 2 2;6 2 3; 6 3 4; 6 4 2; 3 1 2; 2 1 1; 4 1 3];

% shortest是7×7矩阵，shorterst(i,j)的含义是从i到j的最小代价；
% 如果信息不足，相应的值为Inf

% 根据题目条件初始化shortest
shortest=Inf(7);
for i=1:9
    shortest(A(i,2),A(i,1))=A(i,3);
end

while(1)
    [converge,shortest]=expand(shortest);
    if(converge==0)
        break;
    end
end

disp(shortest)

% 通过检索来不断更新shortest
% 如果修改了shortest，converge为1，否则为0
% (i,j)=min((i,k),(k,j))
function [converge,changed]=expand(shortest)
    converge=0;
    changed=shortest;
    for i = 1:7
        for j=1:7
            for k=1:7
            tmp = shortest(i,k) + shortest(k,j);
                if (tmp < Inf && tmp < changed(i,j))
                changed(i,j) = tmp;
                converge=1;
                end
            end
        end
    end
end