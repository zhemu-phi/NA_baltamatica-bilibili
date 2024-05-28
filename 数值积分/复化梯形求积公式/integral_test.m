% 复化梯形求积例子
%   last modified:      07/11/2023
%   file need: comp_tra_integral.m
%%
clc;clear all;format long;
f = @(x) 4./(1+x.^2);

N = [10 20 40 80 160];
delta = zeros(1,5);
k = 1;
for n = N
    T = comp_tra_integral(0,1,n,f);
    delta(k) = abs(pi-T);
    k=k+1;
end
    	plot(N,delta,'-ob');
        legend('复化梯形公式')
    title('T与pi 的误差随n的变化')
disp(delta);
