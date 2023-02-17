%ME 261 Final Exam Problem 1 Main

clc
clear

x = [0 2 4 5 6 9];
H = [0.5 1.3 1.25 1.8 1 0.25];
U = [0.03 0.06 0.05 0.13 0.11 0.02];
y = U.*H;
t = trapz(x,y);
fprintf('The flow rate using MATLAB built-in function is: %.5f\n', t);
Q = TrapezoidalRule(x,y);
fprintf('The flow rate using User-defined function is: %.5f\n', Q);
