% Marco Gomez
% ME 261 Exam 3
%Problem 2 Function

function [a] = GLLS(x,y,w0)
i = x';
j = y';
l = length(x);
Z = [ones(l,1) (cos(w0.*i)) (sin(w0.*i))];
A = Z'*Z;
b = Z'*j;
a = A\b;
end