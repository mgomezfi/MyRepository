% ME 261 Homework 25 Eulers Function
% Marco Gomez

function y = Eulers(h,x,f)
n = length(x);
y(1) = 1;
for i = 1:n-1
y(i+1) = y(i) + h*f(y(i),x(i));
end
end