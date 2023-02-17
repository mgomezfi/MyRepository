% ME 261 Homework 17
% Marco Gomez

clc
clear

Z = 100;
R = 225;
C = .6*10^(-6);
L = .5;
g = @(x) ((1/(R.^2))+(x*C-(1./(x*L))).^2).^(1./2)-(1./Z);
x = [-1000:10:1000];
y =g(x)
plot(x,g(x))
guess = 1;
guess2 = 1000;
roots = [0 0];
roots(1) = fzero(g,guess);
roots(2) = fzero(g,guess2);
fprintf('\nThe angular frequency with initial guess %2d',guess)
fprintf(' is: %.5f\n', roots(1))
fprintf('\nThe angular frequency with initial guess %2d',guess2)
fprintf(' is: %.5f\n', roots(2))