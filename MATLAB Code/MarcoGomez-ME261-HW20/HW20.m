% ME 261 Homework 20
% Marco Gomez

clc
clear
 

funt = [8 -3 -1 17 0 15.5;-2 2 -4 3 6 11;-1 -3 7 1 14 19.5;11 -7 -2 2 3 .5;6 3 6 3 7 21];
save matrix.txt funt -ascii
load matrix.txt

C = matrix;
[rows,columns] = size(C);
aswr = GaussElim(rows,columns,C);
fprintf('****************\n')
for pr=1:rows
    fprintf('  x(%d) = %.3f\n', pr, aswr(pr))
end
fprintf('****************\n')