% ME 261 Homework 21
% Marco Gomez

clc
clear

w0 = 4.19;
t = [0 .15 .30 .45 .60 .75 .90 1.05 1.20 1.35];
x = [1.48 1.26 1.01 0.85 0.89 1.10 1.35 1.54 1.64 1.62];
y = x.^2;

a = GLLS(t,y,w0);
fprintf('The calculated coefficients using Least Squares are:\n a1 = %.3f\n a2 = %.3f\n a3 = %.3f\n',[a(2) a(3) a(1)])
xplot = linspace(0,1.4,25);
yplot = sqrt(a(1)+(a(2).*cos(4.19.*xplot))+(a(3).*sin(4.19.*xplot)));
plot(xplot,yplot)
xlabel('t-values')
ylabel('x-values')
title('Least Squares Curvefit')
hold on
scatter(t,x,'r')
hold off
legend('Curve Fit','Raw Data')