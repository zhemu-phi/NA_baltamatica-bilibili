%% 测试差商计算 
clc;clear;
x0 = [0.4 0.5 0.6 0.7 0.8];
y0 = [-0.916291 -0.693147 -0.510826 -0.357765 -0.223143];
D =divided_differences(x0,y0)

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