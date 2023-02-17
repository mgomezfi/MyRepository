% ME 261 Homework 15
% Marco Gomez
clc
clear


n = 5;
es = 0.5*10^(2-n);
ea = 1;

guess = input('\nEnter initial guess for the mole fraction of H2O: \n');;
xu = 2;
g = @(x) (.05*(1-x))/(sqrt(6/(2+x)));
[first,second] = FixPoint(es,guess,g);


fprintf('\nThe calculated mole fraction of H2O is: %.5f\n', first)
fprintf('It took %2d iterations to converge!\n\n',second)