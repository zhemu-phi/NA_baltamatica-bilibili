function [output]= Hermite_interp(x0,y0,dy0,x)
% 两点三次 Hermite 插值
% x0 : [x1 x2]
% y0 : [y1 y2]
% dy0 : [y1' y2']
% length(x)=1
%
%   Version:            1.0
%   last modified:      05/16/2023
    h = x0(2)-x0(1);
    h1 = x - x0(1);
    h2 = x - x0(2);
    X1 = (h2/h)^2;
    X2 = (h1/h)^2;
    alpha1 = (1+2*h1/h)*X1;
    alpha2 = (1+2*h2/(-h))*X2;
    beta1 = h1*X1;
    beta2 = h2*X2;
    output = alpha1*y0(1)+alpha2*y0(2)+beta1*dy0(1)+beta2*dy0(2);
end

