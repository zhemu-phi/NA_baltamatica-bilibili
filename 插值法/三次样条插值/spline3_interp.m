function [s,M] = spline3_interp(x0,y0,x)
% III 型三次样条插值 
% Input: 节点向量x0,y0
%        目标点 x
% Output: 插值结果 x , M
%   子函数：divided_differences,tridiag_chase,myJocabi
%   Version:            1.0
%   last modified:      04/14/2024    
    n = length(x0);
    h = zeros(1,n-1); h = x0(2:n)-x0(1:n-1);
    nh = length(h);
    lamda = zeros(1,nh-1); 
    lamda = h(2:nh)./(h(1:nh-1)+h(2:nh));
    mu = 1-lamda;
    d= zeros(1,n-1);
    % 计算差商
    D = divided_differences(x0,y0,4);
    d(1:n-2) = D(3:n,4) %取二阶差商
    % 从D中取差商时,注意位置和n的关系
    d(n-1) = 6*(D(2,3)-D(n,3))/(h(1)+h(nh));
    mu = [mu,h(nh)/(h(1)+h(nh))];
    % 表示三对角方程组
    A = diag(2*ones(1,length(d)),0) + diag(mu(2:nh),-1) +diag(lamda,1);
    A(1,n-1) = mu(1);
    A(n-1,1) = h(1)/(h(1)+h(nh));
    % 解三对角方程组
    [M]=myJacobi(A,d',zeros(1,length(d)),10e-8,100); % 得到的M 是列向量
    M = M(:,end);
    M=[M(1);M];
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