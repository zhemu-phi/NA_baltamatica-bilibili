function [X,Ae,be] = gsem_base(A,b)
% Gauss消去法耿直版
% A : 系数矩阵
% b : 右端常数 列向量
% X : 求得的解向量
% Ae: 得到的上三角矩阵
% be: 对应的右端项
% 使用要求，A1(k,k)在计算过程中不出现0
% 缺点：当A1(k,k)较小或近似于0时，计算误差可能增大很多
%
%   Version:            1.0
%   last modified:      09/09/2023
A1 = [A,b];%  A和b的增广矩阵
n = length(A);
n1 = length(A1);
% 系数矩阵 化为上三角的过程如下
t = 0;
for i = 1:n-1
    if A1(i,i) != 0
    	  % 对每一行进行操作
	       for k = i+1:1:n
            lik = A1(k,i)/A1(i,i);    % 算子
            A1(k,i:n1) = A1(k,i:n1)-lik*A1(i,i:n1);
%            T=A1 % 显示运算步骤
	       end
    else
        t = 1;
        fprintf('出现零元素，不能使用该函数');
        break;
    end
end
% 得到上三角后 进行回代
if t == 0
Ae = A1(:,1:n);
be = A1(:,n1);
X  = reg_utm(Ae,be);
end
end