
clc
clear

ea = 1;
n = 5;
es = 0.5*10^(2-n);

xu = 0.15;
xl = 0.05;
capa = 1.5*10^(-9);
epsi = 71*10^(-11);
l = 0.25;
a = 0.12295;
b = 0.3;
f = @(x) ((2*pi*epsi*l)/(acosh(((a.^2)+(b.^2)-(x.^2))/(2*a*b))))-capa;
[root,iterations] = FalsePositionMet(es,xl,xu,f);


fprintf('\nThe eccentricity is: %.5f m\n', root)
fprintf('It took %2d iterations to converge!\n\n',iterations)