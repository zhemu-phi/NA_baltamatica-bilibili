function T = comp_tra_integral(a,b,n,f)
% 复化梯形求积公式
% [a,b]
% n ：小区间的个数
% f：定义好的函数
%
%   Version:            1.0
%   last modified:      07/10/2023
    h = (b-a)/n;
    k = 0:1:n;
    xi = a + k * h;
    yi = f(xi);
    sumy = sum(yi(2:1:n));
    T = (yi(1)/2 + sumy + yi(n+1)/2)*h;
end
