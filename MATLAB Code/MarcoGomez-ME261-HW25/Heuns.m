% ME 261 Homework 25 Heuns Function
% Marco Gomez

function y = Heuns(h,x,f)
n = length(x);
y(1) = 1;
for i = 1:n-1
    yo = y(i)+ h*f(y(i),x(i));
    yop = f(yo,x(i+1));
    yavg = (f(y(i),x(i))+yop)/2.;
    y(i+1) = y(i)+yavg*h;
end
end