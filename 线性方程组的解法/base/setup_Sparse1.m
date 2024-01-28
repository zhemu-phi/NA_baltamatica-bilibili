function [A,b,x_sp] = setup_Sparse1(n)
    % 定义一个 n 阶的稀疏矩阵， 真解全为1
    % Input: n
    % Output: A,b
    %
    %   Version:            1.0
    %   last modified:      09/28/2023
    A = zeros(n,n);b = ones(n,1) * 1.5;
    b([1,n],1) = 2.5; b([n/2,n/2 + 1],1) = 1;
    x_sp = ones(n,1); % 真解
    for i = 1:1:n
        A(i,n+1-i) = 1/2;
        A(i,i) = 3;
    end
    for i =1:1:n-1
        A(i,i+1)= -1;A(i+1,i)= -1;
    end
end
