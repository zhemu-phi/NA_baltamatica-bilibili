function [X] = reg_utm(A,b)
% 解上三角方程组 回代算法
% A : 系数矩阵 必须为上三角
% b : 右端常数
% X : 求得的解向量
% 使用要求：A的对角线处元素不为0
%
%   Version:            1.0
%   last modified:      09/09/2023
if  max(ismember(diag(A),0)) == 1
	fprintf('\n Error:使用reg_utm时 对角线上有0元素，不能使用该函数\n\n');
else
    n = length(b);
    X = zeros(n,1);
    X(n) = b(n)/A(n,n);
    for k=n-1:-1:1
        t = A(k,[k+1:n])*X(k+1:n);
        X(k) = (b(k)-t)/A(k,k);
    end
end
end