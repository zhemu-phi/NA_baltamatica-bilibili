function  y = Lag_interp(x0,y0,x)
% Lagrange 插值公式
% x0：插值节点横坐标所构成的行向量
% y0：插值节点纵坐标所构成的行向量
% x ：所求点的横坐标，所构成的行向量
% y ：得到所求点纵坐标，构成行向量
%
% Version:            2.0
% last modified:      05/03/2023
    nx0 = length(x0);
    nx  = length(x);
    I = Lag_basis(x0,x,nx0,nx);
    y = y0 * I';
end


function output = Lag_basis(x0,x,nx0,nx)
%  Lagrange插值多项式的基函数
%  x0：插值节点横坐标所构成的行向量
%  x ：所求点的横坐标，所构成的行向量
%  nx0：x0的长度
%  nx: x的长度
    I = ones(nx,nx0);
    omega1 = Lag_omega1(x0,x,nx);
    omega2 = Lag_omega2(x0,nx0);
    I = I .* omega1';
    I = I ./ omega2 ;
    X = Lag_single(x0,x,nx0,nx);
    I = I ./ X;
    I(isnan(I)) = 1; %将I中的NaN替换成 1
    output = I;

end


function output = Lag_omega1(x0,x,nx)
%  Lagrange插值多项式基函数中的 分子 ω1
%  x0：插值节点横坐标所构成的行向量
%  x ：所求点的横坐标，所构成的行向量
%  nx：x的长度
    omega1 = zeros(1,nx);
    for i=1:1:nx
        omega1(i)= prod(x(i)-x0);
    end
    output = omega1;
end


function output = Lag_omega2(x0,nx0)
%  Lagrange插值多项式基函数中的 分母 ω2
%  只与插值节点的横坐标有关
%  x0：插值节点横坐标所构成的行向量
%  nx0：x0长度
%得到一个和x0个数相同的
    omega2 = zeros(1,nx0);
    %使用if减少for的使用
    for i = 1:1:nx0
    	       w = x0(i) - x0;
	       if i == 1
	   	       omega2(i) = prod(w(i+1:nx0));
	       elseif i == nx0
	   	       omega2(i) = prod(w(1:i-1));
	       else
	   	       omega2(i) = prod(w(1:i-1)) * prod(w(i+1:nx0));
	       end
    end
    output = omega2;
end


function output = Lag_single(x0,x,nx0,nx)
% Lagrange插值多项式中基函数的 中单独的一项 x_i
%  x0：插值节点横坐标所构成的行向量
%  x ：所求点的横坐标，所构成的行向量
%  nx0：x0的长度
%  nx: x的长度
    X1 = ones(nx,nx0);
    X2 = ones(nx,nx0);
    X1 = X1 .* x0;
    X2 = X2 .* x';
    output = X2-X1;
end