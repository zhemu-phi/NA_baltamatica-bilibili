% 对称正定矩阵的例子
%
%   last modified:      10/03/2023

%% Cholesky test1
clc;clear all;
A = [4 -2 2;-2 2 -4;2 -4 11]; b = [2 2 2]';
R = Cholesky_factorization(A)
X = back_substitution_two(R',R,b)

%% Cholesky test2
clc;clear all;
A = [ 4 12 -16; 12 37 -43;-16 -43 98];
R = Cholesky_factorization(A)

%% 简单矩阵初步测试
clc;clear all;
A = [1 0 ; 0 2];   b = [2 4]'; 
x0 = [0 0]';
[X,r] = Conjugate_Gradient(A,b,x0)

%% 
clc;clear all;
A = [1 -1 0;-1 2 1;0 1 2]; b =[0 2 3]';
x0 = [0 0 0]';
[X,r] = Conjugate_Gradient(A,b,x0)
    
%% Hilbert matrix
clc;clear all;
for n = 3:1:10
A = hilb(n);b = ones(n,1);x0 = zeros(n,1);
[X,r] = Conjugate_Gradient(A,b,x0)
end

%% Sparse matrix 1
clc;clear all;
for n = [4:2:20]
    x0 = zeros(n,1);
    [A,b] = setup_Sparse1(n);
    [~,r] = Conjugate_Gradient(A,b,x0)
end

%% Sparse matrix 2
clc;clear all;
for n = [100 200]
    x0 = zeros(n,1);
    [A,b] = setup_Sparse1(n);
    [~,r] = Conjugate_Gradient(A,b,x0)
end
    
%% Pre_Conjugate_Gradient test
A = [1 -1 0;-1 2 1;0 1 2]; b =[0 2 3]'; M = diag(diag(A));
x0 = [0 0 0]';
[X,r] = Pre_Conjugate_Gradient(A,b,x0,M)