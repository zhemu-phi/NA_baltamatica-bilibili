function  [L,U,P] = PLU_factorization(A)
% PA = LU分解
% Input: A
% output: L,U,P
%   Version:            1.0
%   last modified:      09/27/2023
    n = length(A);
    % 第一次行交换
    [~,s]= max(A(1:n,1)); % s 表示第一列最大元素的位置
    P = eye(n);
    P([1,s],:) = P([s,1],:); 
        A = P*A; % 用初等矩阵左乘A 对 A 作行交换
    A([2:n],1) = A([2:n],1) * (1/A(1,1)); % 求第一层
    for r = 2:1:n
        % 先有 行交换
        p=eye(n);  % 用 p 记录每一次的初等矩阵
        [~,s]= max(A(r:n,r));
         s =  s + r-1;
        p([r,s],:) = p([s,r],:);  
        A = p*A; % A的改变
        P=p*P; % 记录P的变化
            % 求第 r 层
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
