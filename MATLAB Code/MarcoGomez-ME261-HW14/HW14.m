% ME 261 Homework 14
% Marco Gomez
clc
clear


n = 5;
es = 0.5*10^(2-n);
ea = 1;

xl = 0;
xu = 2;
f = @(x) exp(.5.*x)-5+4.*x.^3;
[first,second] = FalPosMet(es,xl,xu,f);


fprintf('\nThe root of the equation is: %.5f\n', first)
fprintf('It took %2d iterations to converge!\n\n',second)
