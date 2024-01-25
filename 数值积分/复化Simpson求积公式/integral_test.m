%   复化Simpson求积例子
%   last modified:      07/14/2023
%   file need：comp_simpson_integral.m
clc;clear all;format long;
f = @(x) 4./(1+x.^2);

N = [10 20 40 80 160];
delta = zeros(1,5);
k = 1;
for n = N
    S = comp_simpson_integral(0,1,n,f);
    delta(k) = abs(pi - S);
    k++;
end
    	plot(N,delta,'b');
disp(delta);
