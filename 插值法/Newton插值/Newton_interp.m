function [N,D] = Newton_interp(x0,y0,x)
% Newton 插值法 插值逼近
% Input: 样本点构成的向量x0 (升序), (纵) y0 
%        x0,y0 是行向量
%        x  
% Output: N 插值结果 , D 差商表
%   Version:            1.0
%   last modified:      04/01/2024
n = length(x0);
D = divided_differences(x0,y0);
D_need = diag(D(:,2:n+1)); % 列
% 表示基函数
n1 = length(x);
for k = 1:1:n1
    xjx = [1,x(k)-x0(1:n-1)]; 
    for i = 2:length(xjx)
        xjx(i) = xjx(i)*xjx(i-1);
    end
    N(k) = xjx * D_need;
end
end