%% 测试差商计算 
clc;clear;
x0 = [0.4 0.5 0.6 0.7 0.8];
y0 = [-0.916291 -0.693147 -0.510826 -0.357765 -0.223143];
D =divided_differences(x0,y0,)

%% Newton插值 test 1 
clc;clear;
x0 = [0.4 0.5 0.6 0.7 0.8];
y0 = [-0.916291 -0.693147 -0.510826 -0.357765 -0.223143];
x = linspace(0.4,0.8);
y = Newton_interp(x0,y0,x)
figure(1)
    plot(x,y,'b')
    hold on 
        plot(x,log(x),'r')
    hold off
    legend('N(x)','ln(x)')
    
%%
clc;clear all;
x0 = linspace(0,15,15);
y0 = sin(x0);
x= linspace(0,15,100);
y = sin(x);
[s,M] = Newton_interp(x0,y0,x);
plot(x,y,'r');
hold on
    plot(x,s,'b');
    plot(x0,y0,'o');
    hold off
    legend('sin(x)','N(x)');