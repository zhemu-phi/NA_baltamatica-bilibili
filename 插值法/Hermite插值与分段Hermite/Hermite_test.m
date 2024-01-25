% Hermite_v0 例子1
%   last modified:      05/16/2023
%   file need: Hermite_interp.m   piecewise_Hermite_interp.m
clc;clear all;
%样本点
x0 = [0 pi/2];%x0 = [0 pi];
y0 = sin(x0);
dy0 = cos(x0);

x = 0:pi/20:pi
y = zeros(1,length(x));
for i= 1:1:length(x)
    y(i) = Hermite_interp(x0,y0,dy0,x(i));
end

plot(x,y);
hold on 
    plot(x,sin(x),'r');
hold off




%% 分段Hermite_v0 例子2
clc;clear all;
Runge = @(x)1./(x.^2+1);  % 定义Runge函数
dRunge = @(x) -(2*x)./((x.^2+1).^2); % 定义导函数

x0 = linspace(-5,5,11);
y0 = Runge(x0);
dy0 = dRunge(x0);
x = linspace(-5,5,100);
yy = piecewise_Hermite_interp(x0,y0,dy0,x)
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
plot(x,yy);
hold on
plot(x,Runge(x),'r');
hold off

