A = [10: 20]

% 找到所有质数的位置
index = find(isprime(A))
% index =
% 
%     2    4    8   10

% 根据位置输出数据
value = A(index)
% value =
% 
%    11   13   17   19