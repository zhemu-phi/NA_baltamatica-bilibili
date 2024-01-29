function [x,k,r] = myJacobi(A,b,x0,e_tol,N)
% Jacobi迭代法解线性方程组
% Input: A, b(列向量), x0(初始值)
%        e_tol: error tolerant  
%        N: 限制迭代次数小于 N 次
% Output: x , k(迭代次数),r:残差
%   Version:            1.0
%   last modified:      01/27/2024
    n = length(b); k = 0; 
    x=zeros(n,N); % 记录每一次迭代的结果，方便后续作误差分析
    x(:,1)=x0; 
    L = -tril(A,-1); U = -triu(A,1); D = diag(diag(A));
    r = norm(b - A*x,2);
    while r > e_tol && k < N
        x(:,k+2) = inv(D)*(b+(L+U)*x(:,k+1));
        r = norm(b - A*x(:,k+2),2); % 残差
        k = k+1;
    end
    x = x(:,2:k+1); % x取迭代时的结果
    
    if k>N
        fprintf('迭代超出最大迭代次数');
    else
        fprintf('迭代次数=%i\n',k);
    end
end
