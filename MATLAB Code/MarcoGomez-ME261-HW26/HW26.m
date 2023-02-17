% ME 261 Homework 26
% Marco Gomez

clc
clear

dydx = @(x,y)y*(x^3)-1.1*y;
tspan = [0:.05:2];
[x,y] = ode45(dydx,tspan,1);
plot(x,y);
title('Solution to the differential equation dy/dx = yx^3-1.1y')
ylabel('y-values')
xlabel('x-values')