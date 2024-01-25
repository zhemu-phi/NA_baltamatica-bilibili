%   file need: comp_GaussianQuadrature
% 复化Gauss求积例子2 pi
clc;clear all;format long;
f = @(x) 4./(1+x.^2);

N1 = 3:1:20; l1 =length(N1);
N2 = 5:1:100; l2 = length(N2);
GS1 = zeros(1,l1);
GS2 = zeros(1,l2);
delta1 = zeros(1,l1);
delta2 = zeros(1,l2);
% n1变，n2不变
k = 1;
for n1 = N1
    GS1(k) = comp_GaussianQuadrature(0,1,n1,5,f);
    delta1(k) = abs(pi - GS1(k));
    k++;
end
P1 = ones(1,l1)*pi;
figure(1);
    	plot(N1,GS1,'-b');
    set(gca, 'YLim', [3.14159, 3.141595]);
    hold on
        plot(N1,P1,'r');
figure(2);
    	plot(N1,delta1,'r')
disp('GS1',GS1);
disp(pi);disp('delta1',delta1);

% n1不变，n2变
k=1;
for n = N2
    GS2(k) = comp_GaussianQuadrature(0,1,3,n,f);
    delta2(k) = abs(pi - GS2(k));
    k++;
end
P2 = ones(1,l2)* pi;
figure(3);
    plot(N2,GS2,'r');
    set(gca, 'YLim', [3.14159, 3.141595]);
figure(4);
    	plot(N2,delta2,'b');
disp('GS2',GS2);
disp(pi);disp('delta2',delta2);
