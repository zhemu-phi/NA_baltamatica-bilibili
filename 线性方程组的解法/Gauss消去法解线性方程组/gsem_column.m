function [X,Ae,be] = gsem_column(A,b)
% 列主元消去法
% A : 表示系数矩阵
% b : 表示右端常数 [列向量]
% X : 求得的解向量
% Ae: 得到的上三角矩阵
% be: 对应的右端项
% 避免了Gauss消去法中出现0的情况
%
%   Version:            1.0
%   last modified:      09/09/2023
A1 = [A,b];%  A和b的增广矩阵
n = length(A);
n1 = length(A1);
% 系数矩阵 化为上三角的过程如下
for i = 1:n-1
	 %[a,s]= max(A1(i:n,i))
    [~,s]= max(A1(i:n,i)); % s表示对应的位置,由于a用不到，用~替代
    s = s+i-1; % 由于s是相A对位置，故有此步
    A1([i,s],:) = A1([s,i],:); % 对应行交换位置
    % 对每一行进行操作
     for k = i+1:1:n
        lik = A1(k,i)/A1(i,i);    % 算子
        A1(k,i:n1) = A1(k,i:n1)-lik*A1(i,i:n1);
%        T=A1 % 显示运算步骤
     end
end
% 得到上三角后 进行回代
Ae = A1(:,1:n);
be = A1(:,n1);
X = reg_utm(Ae,be);
end