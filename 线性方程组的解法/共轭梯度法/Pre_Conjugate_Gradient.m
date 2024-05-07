function [X,r,j] = Pre_Conjugate_Gradient(A,b,x0,M)
% Preconditioned Conjugate Gradient Method
% Input: A--对称正定阵
%        b(列向量),x0(列向量):initial guess
%        M: preconditioner
% Output: X,r: norm(b-A*X,2),j (迭代次数)
%
%   Version:            1.0
%   last modified:      10/03/2023
    invM = inv(M);
    r0 = b - A*x0; z0 = invM * r0; d0 = z0;
    n = length(A);
    rk = r0;zk = z0;xk = x0;dk=d0;
    Rk = rk' * zk;
    j=0;
    for k =1:1:n
        if rk == 0
            break;
        end
        alphak = Rk /(dk' * A * dk );
        xk1 = xk + alphak * dk;
        rk1 = rk - alphak * A *dk;  zk1 = invM * rk1;
        Rk1 = rk1' * zk1;
        betak =  Rk1 / Rk;
        dk1 = zk1 + betak * dk;
        Rk = Rk1; xk = xk1; rk = rk1; dk = dk1;
        j++;
    end
    X = xk;
    r = norm(b-A*X,2);
    fprintf('迭代次数=%i\n',j);
end
