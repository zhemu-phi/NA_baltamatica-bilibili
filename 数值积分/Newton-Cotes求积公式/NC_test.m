% NC求积例子
%
%   last modified:      09/27/2023
clc,clear all,format long;
f1 = @(x)1./(1+x.^2);
a = -4; b = 4;

zhenshi = 2.6516; % 真实值取4位小数的值
Nc = zeros(1,8);
delta = zeros(1,8);
for n =1:1:8
    Nc(n) = ncotes_integral(a,b,n,f1);
    delta(n) = abs(Nc(n)-zhenshi);
end
n =1:8;
figure(1);
plot(n,Nc,'-*b');
figure(2);
plot(n,delta,'-*r');
disp(Nc)
%%
clc,clear all,format long;
f1 = @(x)1./(1+x.^2);
a = -4; b = 4;
zhenshi = 2.6516; % 真实值取4位小数的值
S = zeros(1,20);
delta = zeros(1,20);
for n =3:1:22
    S(n-2) = comp_simpson_integral(a,b,n,f1);
    delta(n-2) = abs(S(n-2)-zhenshi);
end
n =3:22;
figure(1);
plot(n,S,'-*b');
figure(2);
plot(n,delta,'-*r');
disp(S)