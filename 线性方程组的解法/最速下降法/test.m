% 最速下降法 Test
% time :      2024/05/19
%%  例1
clc;clear all,format long;
N = 100; e_tol = 1e-8;
A = [  4,  1,  0,  0; 
       1,  4,  1,  0;  
       0,  1,  4,  1; 
       0,  0,  1,  4;  ]
b=[6; 25; -11; 15];
x0=[0; 0; 0; 0];
[x11,k1,r11] = Gradient_Descent(A,b,x0,e_tol,N)
[x12,k2,r12] = myJacobi(A,b,x0,e_tol,N);
x_exact = gsem_column(A,b)
% 作图查看误差变化
n = length(b);
k1 = k1+1;
% 数值解
    figure(1);
    plot(1:k1,x11(1,:),'-*r',1:k1,x11(2,:),'-og', 1:k1,x11(3,:),'-+b',1:k1,x11(4,:),'-dk');
    legend('x_1','x_2','x_3','x_4');
    title('每个数值解的变化')
% 残差变化
    figure(2);
    plot(1:k1,r11(1:end),'-*r');
    legend('残差');
    title('残差变化')
    
        
%% 例2
clc;clear all;format long;
A = [3  1; 1 5]; 
b = [-1;1];
c = 0; 
N = 100; e_tol = 1e-8; x0 =zeros(length(b),1);

x0 =[-0.2;0]

x = linspace(-1,1,100); 
y = linspace(-1,1,100);
% 网格化、方便作图
[x, y] = meshgrid(x,y);
% 定义函数 f(x) = 0.5 * x' * A * x - x'*b + c
% 为了作图方便,如下定义
f=@(x,y) 0.5 * (A(1,1) * x.^2 + 2 * A(1,2) * x .* y + A(2,2) * y.^2) - (b(1) * x + b(2) * y) + c;
z = f(x,y);

mesh(x,y,z)
[x11,k1,r11] = Gradient_Descent(A,b,x0,e_tol,N);
[x12,k2,r12] = myJacobi(A,b,x0,e_tol,N);
figure(1)
mesh(x,y,z)
hold on
% 绘制最速下降法的每次迭代点
%scatter3(x11(1, :), x11(2, :), f(x11(1,:),x11(2,:)),'r','filled');
plot3(x11(1, :), x11(2, :), f(x11(1,:),x11(2,:)),'r-o');

xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title('函数的三维表示');
hold off;

figure(2)
hold on 
contour(x,y,z,300)
plot(x11(1, :), x11(2, :), 'r-o');
title('最速下降法特点');
colorbar;
