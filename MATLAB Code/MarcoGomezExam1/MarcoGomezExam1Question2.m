%Marco A. Gomez Fierro


%Exam 1 M1C Question 2

clc
clear

used = input('How many cubic meters of water were used?\n');
if used <= 50
    cost = 8*used;
elseif used <= 150
    cost = 400+(used-50)*10;
elseif used <= 250
    cost = 400+1000+(used-150)*12;
elseif used > 250
    cost = 400+1000+1200+(used-250)*14;
end
fprintf('For %d cubic meters of water used the cost is $%.2f\n', used, cost)