%% Jacobi test
% time :      1/28/2023
clc;clear all,format long;
addpath("../base","../Gauss消去法解线性方程组","../Jacobi迭代法解线性方程组") % 加载函数文件
N = 100; e_tol = 1e-8;
%% example 1
A=[10 -1 2 0; -1 11 -1 3; 2 -1 10 -1; 0 3 -1 8];
b=[6; 25; -11; 15];
x0=[0; 0; 0; 0];
t1 =tic;
    [x11,k1] = myJacobi(A,b,x0,e_tol,N)
toc(t1);
t2 = tic;
    [x12] = gsem_column(A,b)
toc(t2);
% 作图查看误差变化
    x_exact=[1;2;-1;1]; %真解
    n = length(b);
    error=zeros(n,k1);% 每个分量的误差
        error = abs(x_exact - x11) 
    res =zeros(1,k1); % 残差
    for i=1:1:k1
        res(i) = norm(b-A*x11(:,i),2);
    end 
    % 数值解
        figure(1);
        plot(1:k1,x11(1,:),'-*r',1:k1,x11(2,:),'-og', 1:k1,x11(3,:),'-+b',1:k1,x11(4,:),'-dk');
        legend('x_1','x_2','x_3','x_4');
    % 残差变化
        figure(2);
        plot(1:k1,res,'-*r');
        legend('残差');
    % 误差
        figure(3);
        plot(1:k1,error(1,:),'-*r',1:k1,error(2,:),'-og', 1:k1,error(3,:),'-+b',1:k1,error(4,:),'-dk');
        legend('x_1','x_2','x_3','x_4');
        
        
%% 测试 消去法 与 迭代法 在处理稀疏矩阵问题上的差距
n = 6; % 
[A,b,x]=setup_Sparse1(n);
x0 = zeros(n,1); 

t1 =tic;
[x11,k1,r1] = myJacobi(A,b,x0,e_tol,N);
toc(t1);

t2 = tic;
[x12] = gsem_column(A,b);
toc(t2);
r2 = norm(b-A*x12);



