%% Gauss-Seidel test
% time :      4/24/2024

%% example 1
clc;clear all,format long;
N = 100; e_tol = 1e-8;
A=[10 -1 2 0; -1 11 -1 3; 2 -1 10 -1; 0 3 -1 8];
b=[6; 25; -11; 15];
x0=[0; 0; 0; 0];
    [x11,k1] = myGS(A,b,x0,e_tol,N)
    [x12,k2] = myJacobi(A,b,x0,e_tol,N)
% 作图查看误差变化
    x_exact=[1;2;-1;1]; %真解
    n = length(b);
    error=zeros(n,k1);% 每个分量的误差
        error = abs(x_exact - x11) 
    res =zeros(1,k1); % 残差
    res1 = res;
    res2 = res;
    for i=1:1:k1
        res1(i) = norm(b-A*x11(:,i),2);
        
    end 
    for i=1:1:k2
        res2(i) = norm(b-A*x12(:,i),2);
    end
    % 数值解
        figure(1);
        plot(1:k1,x11(1,:),'-*r',1:k1,x11(2,:),'-og', 1:k1,x11(3,:),'-+b',1:k1,x11(4,:),'-dk');
        legend('x_1','x_2','x_3','x_4');
        title('G-S下每个数值解的变化')
    % 残差变化
        figure(2);
        plot(1:k1,res1,'-*r');
        hold on
        plot(1:k2,res2,'-*b');
        legend('G-S','Jacobi');
        title('残差变化')
    % 误差
        figure(3);
        plot(1:k1,error(1,:),'-*r',1:k1,error(2,:),'-og', 1:k1,error(3,:),'-+b',1:k1,error(4,:),'-dk');
        legend('x_1','x_2','x_3','x_4');
        title('G-S下每个数值解的误差变化')
        
        
        


