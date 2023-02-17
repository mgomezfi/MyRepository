clc
clear

fx = @(x) 3.*x-0.5.*x.^(2)-4;
dfx = @(x) 3-x;
n = 5;
es = 0.5*10^(2-n);
x = linspace(-5,7,200);
line = zeros(size(x));
plot(x,fx(x))
ylim([-1 1])
hold on
plot(x,line)
hold off
guess = 1;
[root,iterations] = NewtRaphMet(es,guess,fx,dfx);
fprintf('\nThe first positive root of f(x) is: %.4f\n', root)
fprintf('It took %2d iterations to converge!\n',iterations)