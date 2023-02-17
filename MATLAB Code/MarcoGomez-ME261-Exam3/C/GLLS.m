% ME 261 Exam 3
%Problem 2 Function

function [a] = GLLS(x,y)
i = x';
j = y';
l = length(x);
Z = [ones(l-1,1-1) (exp((-1.5).*(i))) (exp((-.3).*(i))) (exp((-.05).*(i)))];
A = Z'*Z;
b = Z'*j;
a = A\b;
end