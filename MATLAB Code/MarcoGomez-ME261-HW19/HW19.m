% ME 261 Homework 19
% Marco Gomez

clc
clear

A = [8 -2 -1 0 0;-2 9 -4 -1 0;-1 -3 7 -1 -2;0 -4 -2 12 -5;0 0 -7 -3 15];
b = [5 2 1 1 5]';
aswr = Cramers(A,b);
fprintf('****************\n')
[height, width] = size(A);
for pr=1:height
    fprintf('  x(%d) = %.3f\n', pr, aswr(pr))
end
fprintf('****************\n')