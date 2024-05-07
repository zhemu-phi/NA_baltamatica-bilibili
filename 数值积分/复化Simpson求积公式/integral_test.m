%   复化Simpson求积例子
%   last modified:      07/14/2023
%   file need：comp_simpson_integral.m
%%
clc;clear all;format long;
f = @(x) 4./(1+x.^2);

N = [10 20 40 80 160];
delta = zeros(1,5);
delta1 =delta;
delta2 = delta;
k = 1;
for n = N
    S = comp_simpson_integral(0,1,n,f);
    T = comp_tra_integral(0,1,n,f);
    delta1(k) = abs(pi - S);
    delta2(k) = abs(pi - T);
    k++;
end
    figure(1)
    	plot(N,delta1,'-or');
    title('复化Simpson误差随n的变化')
    figure(2)
    	plot(N,delta2,'-*b');
    title('复化梯形误差随n的变化')
