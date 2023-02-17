% ME 261 Homework 21
% Marco Gomez

clc
clear

c = [.5 .8 1.5 2.5 4];
k = [1.1 2.5 5.3 7.6 8.9];

i = c.^2;
x = 1./i;
y = 1./k;


n = length(x);
numerator = n*sum(x.*y)-sum(x)*sum(y);
denom = n * sum(x.^2)-(sum(x))^2;
a1 = numerator / denom;
a0 = mean(y)-a1*mean(x);

kmax = 1/a0;
cs = a1*kmax;
answre = [cs kmax];
fprintf('The calculated values for cs and kmax are: %.3f and %.3f respectively.\n', answre)

i = linspace(0,5,50);
j = (kmax.*((i).^2))./(cs+(i).^2);
plot(i,j)
xlabel('Oxygen Concentration (mg/L).')
ylabel('Growth Rate (per d)')
title('Growth Rate of Bacteria')
hold on
scatter(c,k,'r')
hold off
legend('Curve Fit','Raw Data')
