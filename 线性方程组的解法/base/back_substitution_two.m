function [X] = back_substitution_two(L,U,b)
% Ly=b, Ux=y
% b : 列向量
% X : 解向量
%
%   Version:            1.0
%   last modified:      09/25/2023
    y = push_ltm(L,b);
    X = reg_utm(U,y);
end

