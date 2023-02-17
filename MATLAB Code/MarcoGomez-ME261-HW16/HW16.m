% ME 261 Homework 16
% Marco Gomez
clc
clear


n = 4;
es = 0.5*10^(2-n);
ea = 1;

guess1 = input('\nEnter first guess for the root: \n');
guess2 = input('Enter second guess for the root: \n\n');
g = @(x) exp(.5.*x)+(4.*x^(3))-5;
[first,second] = sec_method(es,guess1,guess2,g);
r = fzero(g,guess1);


fprintf('Using fzero the root of the equation is: %.5f\n', r)
fprintf('Using the Secant Method the root of the equation is: %.5f\n', first)
fprintf('It took %2d iterations for the Secant Method to converge.\n',second)