% ME 261 Homework 23
% Marco Gomez


clc
clear
f = @(x) (x.^3).*exp(x);
a = input('Enter lower limit of range: ');
b = input('Enter upper limit of range: ');
n = input('Enter number of subdivisions (must be greater than 1): ');
ar = calc_area_sim(a,b,n,f);
fprintf('\n\nThe value of the integral from a = %d to b = %d\n',a,b)
fprintf('using %d equally spaced divisions is: %.5f\n\n',n,ar)