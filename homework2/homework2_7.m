clear
clc

A1=rand(5,6);
A2=rand(5,6);
A3=rand(5,6);
mat_add(A1)
mat_add(A1+A2)
mat_add(A1+A2+A3)

function A=mat_add(varargin)
    A=zeros(size(varargin{1}));
    for i=1:length(varargin)
        A=A+varargin{i};
    end
end