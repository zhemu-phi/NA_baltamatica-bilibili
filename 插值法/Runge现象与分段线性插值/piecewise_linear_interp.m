function output = piecewise_linear_interp(x0,y0,x)
% 分段线性插值
% x0为样本点横坐标，行向量
% y0为样本点纵坐标，行向量
% x 为 自变量
%
%   Version:            1.0
%   last modified:      06/14/2023
    n1 = length(x0);
    n2 = length(x);
    l = zeros(1,n1);    %预留出基函数的空间
    y = zeros(1,n2);    %预留出x所对的y的空间
    for j =1:1:n2
        if  x(j)>=x0(1) && x(j)<=x0(2)
            l(1) = (x(j)-x0(2))/(x0(1)-x0(2));
        else
            l(1) = 0;
        end

        for i = 2:1:n1-1;
            if  x0(i-1) <= x(j) &&  x(j)<=x0(i)
                l(i) = (x(j) - x0(i-1))/(x0(i)-x0(i-1));
            elseif x0(i)<=x(j) && x(j)<=x0(i+1)
                l(i) = (x(j) - x0(i+1))/(x0(i)-x0(i+1));
            else
                l(i) = 0;
            end
        end

        if x0(n1-1) <= x(j) && x(j) <= x0(n1)
            l(n1) = (x(j) - x0(n1-1))/(x0(n1)-x0(n1-1));
        else
            l(n1) = 0;
        end

        y(j) = y0 * l';
    end
        output = y;
end