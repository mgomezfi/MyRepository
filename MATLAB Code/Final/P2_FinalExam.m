%ME 261 Final Exam Problem 2 Main

clc
clear


x = linspace(2,5,50);
h = (x(2)-x(1));
y = @(x,y) y.*(x-1).^(2/3)-2.*y;
ref = 10;
rk = RK4Met(h,x,y,ref);
plot(x,rk)
title('RK4')
ylabel('y')
xlabel('x')