function  GS = comp_GaussianQuadrature(a,b,n1,n2,f)
%  复化Gauss求积
% [a,b]
% n1 : 一个小区间内选取的积分节点数目
% n2 : 将[a,b]分划成 n2 个小区间
% f: 支持向量运算的函数
%
%   Version:            1.0
%   last modified:      08/04/2023
%   file need:Gaussian_Quadrature
S = zeros(1,n2);
h = (b-a)/n2;
k = 0:1:n2;
jd = a + k * h;
for i =1:1:n2
    S(i) = Gaussian_Quadrature(jd(i),jd(i+1),n1,f);
end
	GS = sum(S);
end

