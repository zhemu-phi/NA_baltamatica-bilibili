% file need: Cholesky_fac.m,    back_substitution_two.m,    gsem_column.m
% time: 1/18/2024
clc,clear all;
addpath("../base","../Gauss消去法") % 加载这两个目录下的函数文件
% ./  表示当前打开文件所在的目录
% ../ 这个目录再往前一个目录
%%
A1 = [4 12 -16;12 37 -43;-16 -43 98];
L1 = Cholesky_fac(A1)


%%  对称正定矩阵下
A2 = [10 1 2 3 4; 1 9 -1 2 -3; 2 -1 7 3 -5; 3 2 3 12 -1; 4 -3 -5 -1 15];
b = [12; -27; 14; -17; 12];
L2 = Cholesky_fac(A2)
x = back_substitution_two(L2,L2',b)
x2 = gsem_column(A2,b)

%% 对称非正定矩阵下 结果不正确
A3 = [-10 1 2 3 4; 1 -5 -1 2 -3; 2 -1 7 3 -5; 3 2 3 12 -1; 4 -3 -5 -1 15];
b = [12; -27; 14; -17; 12];
L3 = Cholesky_fac(A3) %出现虚数


x31 = back_substitution_two(L3,L3',b)

x32 = gsem_column(A3,b)

