clc,clear all;
addpath("../base","../LU分解") % 加载函数文件
A = [1 2 -1;2 1 -2; -3 1 1];
b1 = [3 3 -6];

[L,U] = LU_factorization(A);
X1 = back_substitution_two(L,U,b1)

b = [3 3 -6;1 2 5;4 9 8;10 2 5];
m = length(b); X = cell(1,m);
for i = 1:1:length(b)
    X{i} = back_substitution_two(L,U,b(i,:)')
end


