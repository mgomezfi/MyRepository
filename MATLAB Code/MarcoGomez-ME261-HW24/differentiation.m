% ME 261 Homework 24 Function
% Marco Gomez

function y = differentiation(xx,yy)
n = length(xx);
h = xx(2)-xx(1);
%Forward Difference
y(1) = (-yy(3)+4*yy(2)-3*yy(1))/(2*h);
%Central Difference
for i = 2:n-1
    y(i) = (yy(i+1)-yy(i-1))/(2*h);
end
%Backward Difference
y(n) = ((3*yy(n))-(4*yy(n-1))+(yy(n-2)))/(2*h);
end