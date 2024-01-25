%   file need: Gaussian_Quadrature.m,   comp_GaussianQuadrature
% GS求积例子1
clc,clear all,format long;
f1 = @(x)1./(1+x.^2);
a = -4; b = 4;
zhenshi = 2.65163533; % 真实值取8位小数的值
gs = zeros(1,18);
delta = zeros(1,18);
i=1;
% 进行GS求积
for n=3:1:20
gs(i) = Gaussian_Quadrature(a,b,n,f1);
delta(i) = abs(gs(i)-zhenshi);
i++;
end
n = 3:1:20;
zhenshi1 = ones(1,18)*zhenshi;
figure(1);
    plot(n,gs,'-*r');
    hold on
    plot(n,zhenshi1,'-b');
figure(2);
    plot(n,delta,'-*r');
disp('delta',delta);

% 进行复化GS求积 对比看看
% 变n1，不变n2
GS1 = zeros(1,18);
delta1 = zeros(1,18);
i=1;
for n = 3:1:20
    GS1(i) = comp_GaussianQuadrature(a,b,n,10,f1);
    delta1(i) = abs(GS1(i)-zhenshi);
    i++;
end
n = 3:1:20;
figure(3);
    plot(n,GS1,'-*r');
    hold on
    plot(n,zhenshi1,'-b');
figure(4);
    plot(n,delta1,'-*r');
disp('GS1',GS1);
disp('delta1',delta1);
% 不变n1，变n2
N = 5:40; l=length(N);
GS2 = zeros(1,l);
delta2 = zeros(1,l);
i=1;
for n = N
    GS2(i) = comp_GaussianQuadrature(a,b,6,n,f1);
    delta2(i) = abs(GS2(i)-zhenshi);
    i++;
end
zhenshi2 = ones(1,l)*zhenshi;
figure(5);
    plot(N,GS2,'-*r');
    hold on
    plot(N,zhenshi2,'-b');
figure(6);
    plot(N,delta2,'-*r');
disp('GS2',GS2);
disp('delta2',delta2);