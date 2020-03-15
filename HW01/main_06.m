% ceil: 朝正无穷大四舍五入
ceil(0.4)   
% ans =  1

ceil(0.6)
% ans =  1

ceil(-0.4)
% ans = -0

ceil(-0.6)
% ans = -0

% fix: 朝零四舍五入
fix(0.4)
% ans = 0

fix(0.6)
% ans = 0

fix(-0.4)
% ans = -0

fix(-0.6)
% ans = -0

% floor: 朝负无穷四舍五入
floor(0.4)
% ans = 0

floor(0.6)
% ans = 0

floor(-0.4)
% ans = -1

floor(-0.6)
% ans = -1

% idivide: 带有舍入选项的整除
idivide(2, 5)
% ans = 0

idivide(3, 5)
% ans = 0

% mod: 除后的余数(取模运算)
mod(5, 2)
% ans =  1

mod(10, 3)
% ans =  1

mod(-5, 2)
% ans =  1

mod(-10, 3)
% ans =  2

% rem: 除后面的余数
rem(5, 2)
% ans =  1

rem(10, 3)
% ans =  1

rem(-5, 2)
% ans = -1

rem(-10, 3)
% ans = -1

% round: 四舍五入为最近的小数或整数
round(0.4)
% ans = 0

round(0.6)
% ans =  1

round(-0.4)
% ans = -0

round(-0.6)
% ans = -1