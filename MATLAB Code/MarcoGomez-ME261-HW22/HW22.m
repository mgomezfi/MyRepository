% ME 261 Homework 22
% Marco Gomez

clc
clear

x = [0 1 2 3 4 5 6 7 8 9];
y = [9.45 4.35 3.65 4.20 4.55 6.10 6.90 9.35 11.40 14.26];
i = x';
j = y';
l = length(x);
Z = [ones(l,1) (1./((i+1).^2)) i.^2];
A = Z'*Z;
b = Z'*j;
a = A\b;

fprintf('The calculated coefficients using Least Squares are:\n c1 = %.3f\n c2 = %.3f\n c3 = %.3f\n', a)

xplot = linspace(0,9,50);
yplot = a(1)+(a(2)./((xplot+1).^2))+a(3).*(xplot).^2;
plot(xplot,yplot)
xlabel('x-values')
ylabel('y-values')
title('Least Squares Curvefit')
hold on
scatter(x,y,'r')
hold off
legend('Curve Fit','Raw Data')
