function [integ,A] = AdapQuad(f,a,b,TOL)
% 自适应步长梯形公式求f在给定区间[a,b]上的积分，误差容限为TOL
% 编程思路参考索尔的教材
integ = 0;
% 积分值初始化
lgth = abs(b-a);
% 计算区间的总长度
A=(a);
% 用来存放每个区间的左端点，特别地，除第一个元素，其他元素都是插入点的横坐标
nfitv=1;
% number of intervals,表示还有多少个区间上的近似积分待计算
S=@(x,y)(y-x)*(f(x)+f(y))/2;
% 梯形公式

while nfitv>0
c = (a+b)/2;
A(end+1)= c;
if abs(S(a,b)-S(a,c)-S(c,b))<3*TOL*(b-a)/lgth
integ = integ+S(a,c)+S(c,b);
nfitv = nfitv-1;
% 在容许误差内，则采用这一近似，并把待算区间数减一
A=sort(A);
if nfitv>0
 a=A(nfitv);
b=A(nfitv+1);
end
% 可以看出每次计算的都是当前最后一个区间
% 所以最后一个区间算完后就算倒数第二个区间
% 又知道此时待求区间数为nfitv
% 给A排序后，元素按坐标大小排列，则对应的两个区间端点即为如上所示
else
a=c;
nfitv=nfitv+1;
% 不在容许误差内，则插入新的二分点，并把待算区间数加一
end
end
end