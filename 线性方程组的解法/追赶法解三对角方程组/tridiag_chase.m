function [x]=tridiag_chase(A,f)
    % 追赶法解三对角方程组
    % 输入:  适用的三对角矩阵A,  右端向量f
    % 输出:  解，列向量的形式 x
    % 创建时间: 1/26/2024
    % 版本: 1.0
    n = length(A);
    % 将三对角提取出来
    b = diag(A,0); a = diag(A,-1); c = diag(A,1);
    % 处理一下角标 a是从a_2开始, l从l_2 开始
    a = cat(1,[0],a); % a = [0, diag(A,-1)]
    u = zeros(1,n);l = zeros(1,n);
    u(1) = b(1);
    for i = 2:1:n
        l(i) = a(i)/u(i-1);
        u(i) = b(i)-l(i)*c(i-1);
    end
    % Ly = b
    y = zeros(1,n);
    y(1) = f(1);
    for i =2:1:n
        y(i) = f(i)-l(i)*y(i-1);
    end
    % Ux= y
    x = zeros(n,1);
    x(n) = y(n)/u(n);
    for i =n-1:-1:1
        x(i) = (y(i) - c(i)* x(i+1))/u(i);
    end
end