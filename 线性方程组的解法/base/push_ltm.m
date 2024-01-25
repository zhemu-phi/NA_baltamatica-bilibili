function [X] = push_ltm(A,b)
% 解下三角方程组    前推算法
% A : 表示系数矩阵 必须为下三角
% b : 表示右端常数
% X : 求得的解向量
% 使用要求：对角线处元素不为0
%
%   Version:            1.0
%   last modified:      05/16/2023
if  max(ismember(diag(A),0)) == 1
	fprintf('*************************\n 对角线上有0元素，不能使用该函数 \n********************   ');
else
    n = length(b);
    X = zeros(n,1);
    X(1) = b(1)/A(1,1);
    for k=2:n
        t = A(k,[1:k-1])*X(1:k-1);
        X(k) = (b(k)-t)/A(k,k);
    end
end

end
