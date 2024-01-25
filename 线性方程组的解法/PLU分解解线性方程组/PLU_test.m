% PA = LU test
%
%   last modified:      09/27/2023

%% 1
clc;clear all;
A = [1 2 -1;2 1 -2; -3 1 1];
b1 = [3 3 -6]';
[L,U,P] = PLU_factorization(A);
X1 = back_substitution_two(L,U,P*b1)

b = [3 3 -6;1 2 5;4 9 8;10 2 5];
m = length(b); X = cell(1,m);
for i = 1:1:length(b)
    X{i} = back_substitution_two(L,U,P.*b(i,:))
end

%% 2
clc;clear all;
A = [2 1 5 ; 4 4 -4 ;1 3 1];
[L,U,P] = PLU_factorization(A)
    
%% 3 
clc;clear all;
A = [2 3 ; 3 2];
[L,U,P] = PLU_factorization(A)
