function [D] = divided_differences(x0,y0)
% Newton插值中用到的差商计算
% Input: 互异样本点构成的向量 (横) x0, (纵) y0
% Output: 差商表 D
%   Version:            1.0
%   last modified:      04/01/2024
n = length(x0);
D = zeros(n,n+1); 
D(:,1) = x0 ;D(:,2) = y0;
% 列循环
for k = 3:1:n+1  
    % 行循环
    for i =k-1:1:n 
        D(i,k) = D(i,k-1) - D(i-1,k-1);
        D(i,k) = D(i,k)/(x0(i)-x0(i-(k-2)));
        %D   % 取消注释 D 可以观察每次的变化
    end
end
end