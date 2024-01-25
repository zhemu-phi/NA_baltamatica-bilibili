function output = Gaussian_Quadrature(a,b,n,f)
% Gauss求积
% [a,b]
% n : 积分节点个数
% f: 支持向量运算的函数
%
%   Version:            1.0
%   last modified:      08/04/2023
%   file need: gs_quadrature.mat
load('gs_quadrature.mat');
xi = jiedian{n}; % 是列向量
Xi = ((a+b)+(b-a)*xi)./2;
Yi = f(Xi);
alpha = quanzhong{n}; % 是列向量
A = alpha .* Yi;
Sum = sum(A);
output = (b-a)/2 * Sum;
end