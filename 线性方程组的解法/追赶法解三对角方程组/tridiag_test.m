% file need: tridiag_chase.m,  gsem_column.m
% time: 1/26/2024
clc,clear all;
addpath("../base","../Gauss消去法","../追赶法解三对角方程组") % 加载函数文件
%%
A = [2 -1 0 0 0; -1 2 -1 0 0; 0 -1 2 -1 0; 0 0 -1 2 -1; 0 0 0 -1 2];
f = [1 ;0; 0; 0; 2];

t1 = tic;
x1 = tridiag_chase(A,f)
toc(t1);

t2 = tic;
x2 = gsem_column(A,f)
toc(t2);
