function [integ,A] = AdapQuad(f,a,b,TOL)
% ����Ӧ�������ι�ʽ��f�ڸ�������[a,b]�ϵĻ��֣��������ΪTOL
% ���˼·�ο������Ľ̲�
integ = 0;
% ����ֵ��ʼ��
lgth = abs(b-a);
% ����������ܳ���
A=(a);
% �������ÿ���������˵㣬�ر�أ�����һ��Ԫ�أ�����Ԫ�ض��ǲ����ĺ�����
nfitv=1;
% number of intervals,��ʾ���ж��ٸ������ϵĽ��ƻ��ִ�����
S=@(x,y)(y-x)*(f(x)+f(y))/2;
% ���ι�ʽ

while nfitv>0
c = (a+b)/2;
A(end+1)= c;
if abs(S(a,b)-S(a,c)-S(c,b))<3*TOL*(b-a)/lgth
integ = integ+S(a,c)+S(c,b);
nfitv = nfitv-1;
% ����������ڣ��������һ���ƣ����Ѵ�����������һ
A=sort(A);
if nfitv>0
 a=A(nfitv);
b=A(nfitv+1);
end
% ���Կ���ÿ�μ���Ķ��ǵ�ǰ���һ������
% �������һ�������������㵹���ڶ�������
% ��֪����ʱ����������Ϊnfitv
% ��A�����Ԫ�ذ������С���У����Ӧ����������˵㼴Ϊ������ʾ
else
a=c;
nfitv=nfitv+1;
% ������������ڣ�������µĶ��ֵ㣬���Ѵ�����������һ
end
end
end