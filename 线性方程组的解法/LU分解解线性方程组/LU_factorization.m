function  [L,U] = LU_factorization(A)
% LU分解
% A ： 系数矩阵
% A = LU
%   Version:            1.0
%   last modified:      09/25/2023
n = length(A);
A([2:n],1) = A([2:n],1) * (1/A(1,1)); 
for r = 2:1:n
    for k = r:1:n
        A(r,k) = A(r,k) - A(r,[1:r-1])*A([1:r-1],k);
    end
    for m = r+1:1:n
        A(m,r) = (A(m,r) - A(m,[1:r-1])*A([1:r-1],r))*(1/A(r,r));
    end
end
L = tril(A,-1)+eye(n);
U = triu(A,0);
end
