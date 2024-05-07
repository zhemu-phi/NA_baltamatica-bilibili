function [X,r,j] = Conjugate_Gradient(A,b,x0)
% 共轭梯度法解线性方程组 系数矩阵正定对称
% Input: A--对称正定阵
%        b(列向量),x0(列向量):initial guess
% Output: X,r: norm(b-A*X,2),j (迭代次数)
%
%   Version:            1.0
%   last modified:      10/03/2023
    r0 = b - A*x0; d0 = r0;
    n = length(A);
    rk = r0;dk = d0;xk = x0; Rk = rk' * rk;j=0;
    for k =1:1:n
        if rk == 0
            break;
        end
        alphak = Rk /(dk' * A * dk );
        xk1 = xk + alphak * dk;
        rk1 = rk - alphak * A *dk;  Rk1 = rk1' * rk1;
        betak =  Rk1 / Rk;
        dk1 = rk1 + betak * dk;
        Rk = Rk1; xk = xk1; rk = rk1; dk = dk1;
        j++;
    end
    X = xk;
    r = norm(b-A*X,2);
    fprintf('迭代次数=%i\n',j);
end
