% 线性方程组的例子
%   last modified:      09/09/2023
%%
clc;clear all;
A = [10 1 2 3 4; 1 9 -1 2 -3; 2 -1 7 3 -5; 3 2 3 12 -1; 4 2 3 4 15];
b = [12; -27; 14; -17; 10];

X1 = gsem_base(A,b)
X2 = gsem_column(A,b)
X3 = gsem_complete(A,b)


