% file need: tridiag_chase.m,  gsem_column.m
% time: 1/26/2024
%%
clc,clear all;
n = 1000;  % 方程组的阶数 10 100 500 1000
A = diag(2*ones(n,1)) + diag(-1*ones(n-1,1),1) + diag(-1*ones(n-1,1),-1);
f = (1:n)';
t1 = tic;
x1 = tridiag_chase(A,f);
toc(t1);

t2 = tic;
x2 = gsem_column(A,f);
toc(t2);

delta = norm(abs(x1-x2))