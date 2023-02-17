% ME 261 Homework 19 Cramers Rule Function
% Marco Gomez

function [x] = Cramers(A,b)
dD = det(A);
[height, width] = size(A);
x = zeros(1,height);
for z= 1:height
   C = A;
   C(:,z) = b;
   nD = det(C);
   sol = nD/dD;
   x(z) = sol;
end
end