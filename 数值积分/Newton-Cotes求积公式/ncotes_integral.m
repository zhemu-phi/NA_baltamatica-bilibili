function [NC] = ncotes_integral(a,b,n,f)
% Newton-Cotes 求积公式
% [a,b] 的 n 等分
% f：提前定义好的函数,要求支持向量运算
% n 不超过 8
% linspace可以把[a,b]等分成n个点，n-1个区间
%
%   Version:            1.0
%   last modified:      07/06/2023
    x0 = linspace(a,b,n+1); % 故此处是n+1
    y0 = f(x0);
    Cotes = cell(1,8); % 创建一个空的元胞数组
    Cotes{1} = [1/2 1/2];
    Cotes{2} = [1/6 4/6 1/6];
    Cotes{3} = [1/8 3/8 3/8 1/8];
    Cotes{4} = [7/90 32/90 2/90 32/90 7/90];
    Cotes{5} = [19/228 75/228 50/228 50/228 75/228 19/228];
    Cotes{6} = [41/840 216/840 27/840 272/840 27/840 216/840 41/840];
    Cotes{7} = [751/17280 3577/17280 1323/17280 2989/17280 2989/17280 1323/17280 3588/17280 751/17280];
    Cotes{8} = [989/28350 5888/28350 -928/28350 10496/28350 -4540/28350 10496/28350 -928/28350 5888/28350 989/28350];
    
    sum_yc = sum(Cotes{n} .* y0);
    NC = (b-a) * sum_yc;
end