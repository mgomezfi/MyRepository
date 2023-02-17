% ME 261 Homework 25
% Marco Gomez

clc
clear

h = .05;
x = 0:.05:1;
f = @(y,x) (1+4*x)*(sqrt(y));
Euler = Eulers(h,x,f);
Heun = Heuns(h,x,f);
RK = RK4(h,x,f);
plot(x,Euler,x,Heun,x,RK,'ok')
axis([0 1 1 7])
legend('Euler''s Method','Heun''s Method','RK4 Method')
title('y vs. x')
ylabel('y')
xlabel('x')