

clc
clear

t = [0.5 1 2 3 4 5 6 7 9];
p = [2.45 2.10 1.79 1.64 1.48 1.38 1.30 1.18 1.05];
y = p.^2;

a = GLLS(t,y);
fprintf('The calculated coefficients using Least Squares are:\n A1 = %.3f\n A2 = %.3f\n A3 = %.3f\n',a)
xplot = linspace(0,10,25);
yplot = sqrt(a(1).*(exp((-1.5).*(xplot)))+a(2).*(exp((-.3).*(xplot)))+a(3).*(exp((-.05).*(xplot))));
plot(xplot,yplot)
xlabel('t-values')
ylabel('p-values')
title('Least Squares Curvefit')
hold on
scatter(t,p,'r')
hold off
legend('Curve Fit','Raw Data')