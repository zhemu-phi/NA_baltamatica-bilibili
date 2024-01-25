% 线性方程组的例子
%   last modified:      09/09/2023

%%
clc;clear all;
A = [10 1 2 3 4; 1 9 -1 2 -3; 2 -1 7 3 -5; 3 2 3 12 -1; 4 2 3 4 15];
b = [12; -27; 14; -17; 10];

[X1,L,U] = LU_Doolittle(A,b)
X2 = gsem_column(A,b)
X3 = gsem_base(A,b)
%%
clc;clear all;
A = rand(10); % 生成一个 10x10 的随机矩阵 A
b = rand(10, 1); % 生成一个 10x1 的随机向量 b
t1 = tic;
[X1,A1,B1] = gsem_complete(A,b);toc(t1);
t2 = tic;
[X2,A2,B2] = LU_Doolittle(A,b);toc(t2);
t3 = tic;
[X3,A3,B3] = gsem_base(A,b);toc(t3);
%%
clc;clear all;
A = rand(150);b = rand(150,1);
t1 = tic;
[X1,A1,B1] = LU_Doolittle(A,b);toc(t1);
t2 = tic;
[X2,A2,B2] = gsem_column(A,b);toc(t2);
t3 = tic;
[X3,A3,B3] = gsem_base(A,b);toc(t3);

