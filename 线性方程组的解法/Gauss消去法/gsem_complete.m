function [X,Ae,be] = gsem_complete(A,b)
% 全主元消去法
% A : 系数矩阵
% b : 右端常数 [列向量]
% X : 求得的解向量
% Ae: 得到的上三角矩阵
% be: 对应的右端项
% 比列主元更加稳定了
%
%   Version:            1.0
%   last modified:      09/09/2023
A1 = [A,b];    %A和b的增广矩阵
n = length(A);
n1 = length(A1);
X = zeros(n,1);
t = 1:n; % t 用于修正解的位置与原方程不匹配
% 系数矩阵化为上三角的过程如下
for i = 1:n-1
	   A = A1(i:n,i:n);
    [m,a,b] = max_loc(A); %这里不用A1，避免误判b中元素
    % a,b是相对的位置
    a = a+i-1;
    b = b+i-1;
    A1([i,a],:) = A1([a,i],:); % 对应行交换位置
    A1(:,[i,b]) = A1(:,[b,i]); % 对应列交换位置
    [t(i),t(b)]= deal(t(b),t(i));
    % 对每一行进行操作
	    for k = i+1:1:n
        lik = A1(k,i)/A1(i,i);    % 算子
        A1(k,i:n1) = A1(k,i:n1)-lik*A1(i,i:n1);
%        T=A1 % 显示运算步骤
     end
end
% 得到上三角后进行回代
Ae = A1(:,1:n);
be = A1(:,n1);
X([t])= reg_utm(Ae,be); %使解匹配原方程位置
end