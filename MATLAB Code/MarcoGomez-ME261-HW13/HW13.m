% ME 261 Homework 13
% Marco Gomez
clc
clear


n = 4;
es = 0.5*10^(2-n);
g = 9.81;
ea = 1;
maxn = 10;
yl = .5;
yu = 2.5;
f = @(x) 1-(((20^2)*(3+x))/(g*(((3*x)+(x^2)/2))^3));
[first,second] = BisecMet(yl,yu,es,maxn,f);


fprintf('\nThe root of f(x) is: %.4f\n', first)
fprintf('It took %2d iterations to converge!\n\n',second)
