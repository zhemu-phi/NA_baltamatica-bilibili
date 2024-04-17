function [out1] = piecewise_Hermite_interp(x0,y0,dy0,x)
    % 分段Hermite插值
    % x0 : [x1 x2 ...]
    % y0 : [y1 y2...]
    % dy0 : [y1' y2'...]
    %
    %   Version:            1.0
    %   last modified:      09/13/2023
    %   file need: Hermite_interp.m
    m = length(x);
    n = length(x0);
    y = zeros(1,m);
    for k =1:1:m
        for i =1:1:n-1
        	   if x0(i)<=x(k) && x(k)<= x0(i+1)
        	   	 y(k) = Hermite_interp(x0([i,i+1]),y0([i,i+1]),dy0([i,i+1]),x(k));
        	   end
        end
    end
    out1 = y;
end
