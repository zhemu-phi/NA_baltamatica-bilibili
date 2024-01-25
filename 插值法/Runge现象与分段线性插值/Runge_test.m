%   last modified:      04/22/2023
%	文件需要: piecewise_linear_interp.m	,	Lag_interp.m

% 龙格现象展示

%% 
clc;clear all;format long;
x = linspace(-5,5,100);
    % 使用函数句柄的方式表示函数
Runge = @(x)1./(x.^2+1);
y = Runge(x);

% 计算误差前的准备
x2 = linspace(-5,5,1001);
y2 = Runge(x2);
delta = zeros(1,19);
% 绘制 f（x）图像和 插值函数图像
	%figure(1);
for n = 2:1:20
    % 随着 n 的 变化，样本点也在发生变化
	x1 = linspace(-5,5,n+1);
	y1 = Runge(x1);
	Ln = Lag_interp(x1,y1,x);
	%subplot(4,5,n-1)
    figure(n-1); %生成一个新的图像窗口
	plot(x,Ln,'b');
	hold on
	   plot(x,y,'r');
	hold off

	% 计算误差
     delta(n-1) = max(abs(y2 - Lag_interp(x1,y1,x2)));
end

% 观察误差
n = 2:1:20;
%subplot(4,5,20)
figure(20);
plot(n,delta,'g');




%%
clc;clear all;format long;
x = linspace(-5,5,100);
    % 使用函数句柄的方式表示函数
Runge = @(x)1./(x.^2+1);
y = Runge(x);

% 计算误差前的准备
x2 = linspace(-5,5,1001);
y2 = Runge(x2);
delta = zeros(1,19);
% 绘制 f（x）图像和 插值函数图像
	figure(1);
for n = 2:1:20
    % 随着 n 的 变化，样本点也在发生变化
	x1 = linspace(-5,5,n+1);
	y1 = Runge(x1);
	Ln = Lag_interp(x1,y1,x);
	subplot(4,5,n-1)
	plot(x,Ln,'b');
	hold on
	   plot(x,y,'r');
	hold off

	% 计算误差
     delta(n-1) = max(abs(y2 - Lag_interp(x1,y1,x2)));
end

% 观察误差
n = 2:1:20;
subplot(4,5,20)
plot(n,delta,'g');









