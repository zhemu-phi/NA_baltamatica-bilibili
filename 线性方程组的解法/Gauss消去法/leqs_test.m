% 线性方程组的例子
%   last modified:      09/09/2023
clc;clear all;
addpath("../base","../Gauss消去法") % 加载这两个目录下的函数文件
%%
A = [10 1 2 3 4; 1 9 -1 2 -3; 2 -1 7 3 -5; 3 2 3 12 -1; 4 2 3 4 15];
b = [12; -27; 14; -17; 10];

X2 = gsem_column(A,b)
X3 = gsem_base(A,b)

