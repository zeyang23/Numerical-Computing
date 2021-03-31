clear
clc


A=[7 5 4;7 6 1; 7 3 7;5 2 2;6 2 3; 6 3 4; 6 4 2; 3 1 2; 2 1 1; 4 1 3];

% shortest��7��7����shorterst(i,j)�ĺ����Ǵ�i��j����С���ۣ�
% �����Ϣ���㣬��Ӧ��ֵΪInf

% ������Ŀ������ʼ��shortest
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

% ͨ�����������ϸ���shortest
% ����޸���shortest��convergeΪ1������Ϊ0
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