function [x,k,r] = Gradient_Descent(A,b,x0,e_tol,N)
    % 最速下降法 解线性方程组
    % Input: A, b(列向量), x0(初始值),e_tol: error tolerant, N: 限制迭代次数小于 N 次             
    % Output: x , k(迭代次数), r
    %   Version:            1.0
    %   last modified:      2024/05/19
    n = length(b); k = 0; 
    R = zeros(1,N); % 记录残差
    r = b - A*x0;
    x = zeros(n,N); % 记录每次迭代结果
    x(:,1) = x0;
    norm_r = norm(r,2); R(1) = norm_r;
    while norm_r > e_tol && k < N
        alpha = r'*r/(r'*A*r);  % 计算步长
        x(:,k+2) = x(:,k+1) + alpha * r;
        r = b - A * x(:,k+2); % 残量
        norm_r = norm(r,2);
        R(k+2)=norm_r;
        k = k+1;
    end
    x = x(:,1:k+1); % 返回每次的迭代结果
    r = R(1:k+1);   % 返回每次的残差
    if k>N
        fprintf('迭代超出最大迭代次数');
    else
        fprintf('迭代次数=%i\n',k);
    end
end