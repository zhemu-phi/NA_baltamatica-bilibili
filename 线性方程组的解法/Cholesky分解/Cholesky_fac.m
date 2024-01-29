function [L] = Cholesky_fac(A)
    % 对称正定矩阵 的 Cholesky分解 
    % A = LL'
    % 输入:
    %    A,对称正定
    % 输出: 
    %    分解后的 下三角 L 
    % 创建时间: 1/18/2024
    % 版本: 1.0
    n = length(A);
    for i = 1:1:n-1
        A(i,i) = sqrt(A(i,i));
        A(i+1:n,i) = A(i+1:n,i)/A(i,i);
        A(i+1:n,i+1:n) = A(i+1:n,i+1:n)-A(i+1:n,i)*A(i+1:n,i)';
    end
    A(n,n)= sqrt(A(n,n));
    L = tril(A);
end