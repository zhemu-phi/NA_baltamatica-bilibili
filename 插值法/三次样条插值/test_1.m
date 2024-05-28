%   last modified:      04/23/2024
%% 1 I 型三次样条插值 课本P55 例2.13
clc;clear all;
x0 = [0 1 2 3];
y0 = [0 0 0 0];
df0 = 1;dfn = 0;
x = 1/2;
[s,M] = spline1_interp(x0,y0,df0,dfn,x)

x= linspace(0,3);
s = spline1_interp(x0,y0,df0,dfn,x);
plot(x,s)
hold on
plot (x0,y0,'o')
title('三次样条插值')
%% 2 II 型三次样条插值  y = x^3
clc;clear all;
x0 = linspace(0,3,10);
y0 = x0.^3;
dff0 = 0;dffn = 18;
x= linspace(0,3,200);
y = x.^3;
[s,M] = spline2_interp(x0,y0,dff0,dffn,x);
plot(x,y,'r');
hold on
    plot(x,s,'b');
hold off

%% 3 III 型三次样条插值  y =sin(x)
clc;clear all;
x0 = linspace(0,4*pi,50);
y0 = sin(x0);
x= linspace(0,4*pi,200);
y = sin(x);
[s,M] = spline3_interp(x0,y0,x);
plot(x,y,'r');
hold on
    plot(x,s,'b');
    plot(x0,y0,'o');
    legend('sin(x)','s(x)')
    hold off

%% 4 Runge函数下的表现 
clc;clear all;format long;
Runge = @(x)1./(x.^2+1);
x0 = linspace(-5,5,100);
y0 = Runge(x0);
df0 = 10/(25+1)^2; dfn = -10/(25+1)^2;

x=linspace(-5,5,200);
y = Runge(x);
s = spline1_interp(x0,y0,df0,dfn,x);
plot(x,y,'r');
hold on
    plot(x,s,'b');
    plot(x0,y0,'o');
    legend('f(x)','s(x)')
    hold off

delta = max(abs(y- s))