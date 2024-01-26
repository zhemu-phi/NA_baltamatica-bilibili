function S = comp_simpson_integral(a,b,n,f)
% [a,b]
% n ：小区间的个数, 要求是偶数
% f：定义好的函数
%
%   Version:            1.0
%   last modified:      07/14/2023
    if mod(n,2) != 0    % 判断n是否为偶数，如果不是，使其变为偶数
    	   n = n+1;
    end
    h = (b-a)/n;
    k = 0:1:n;
    xi = a + k * h;
    yi = f(xi);
    m = n/2;
    i1 = 0:1:m-1;
        sumy1 = sum(yi(2*i1+1 +1)); % f(x_{2i+1})求和
    i2 = 1:1:m-1;
        sumy2 = sum(yi(2*i2 +1)); % f(x_{2i})求和
    S = (yi(1) + 4*sumy1 + 2*sumy2 + yi(n+1)) * h/3;
end
