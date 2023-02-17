% Marco Gomez
% ME 261 Exam 3
%Problem 1 Main

clc
clear

C = [8 -3 -1 17 67;-2 2 -4 3 2;-1 -3 7 1 18;11 -7 -2 2 -1];

[rows,columns] = size(C);
aswr = GaussElimination(rows,columns,C);
fprintf('****************\n')
for pr=1:rows
    fprintf('  x(%d) = %.3f\n', pr, aswr(pr))
end
fprintf('****************\n')