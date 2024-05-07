function [s,M] = spline1_interp(x0,y0,df0,dfn,x)
% I型三次样条插值 
% Input: 节点向量x0,y0,两个端点的一阶导 df0,df1
%        目标点 x
% Output: 插值结果 s , M
%   子函数：divided_differences,tridiag_chase
%   Version:            1.0
%   last modified:      04/14/2024    
    n = length(x0);
    h = zeros(1,n-1); h = x0(2:n)-x0(1:n-1);
    nh = length(h);
    lamda = zeros(1,nh-1); 
    lamda = h(2:nh)./(h(1:nh-1)+h(2:nh));
    mu = 1-lamda;
    d= zeros(1,n);
    % 计算差商
    D = divided_differences(x0,y0,4);
    d(2:n-1) = D(3:n,4); %取二阶差商
    d(1) = 6/h(1) * ((y0(2)-y0(1))/h(1) - df0);
    d(n) = 6/h(n-1) * (dfn - (y0(n)-y0(n-1))/h(n-1));
    % 表示三对角方程组
    A = diag(2*ones(1,n),0) + diag([mu,1],-1) +diag([1,lamda],1);
    % 解三对角方程组
    [M]=tridiag_chase(A,d);
    % 分段表示
    nx = length(x);
    s = zeros(1,nx);
% 对于每个 x
for j = 1:1:nx 
    % 判断在哪个小区间
    for i = 1:n-1
        if x(j) >= x0(i) && x(j) <= x0(i+1)
            hi = h(i); t2 = x0(i+1);t1 = x0(i); 
            M2 = M(i+1);M1 = M(i);
            s(j) =1/(6*hi) * ((t2-x(j))^3 *M1 +(x(j) -t1)^3*M2);
            s(j) = s(j) + 1/hi *( (t2-x(j)) * y0(i) + (x(j)- t1)*y0(i+1) );
            s(j) = s(j) - hi/6 * ( (t2-x(j))*M1 + (x(j)-t1)*M2 );
            break;
        end
    end
end
end