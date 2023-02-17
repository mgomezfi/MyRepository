clc
clear
inc = input('Enter the desired increment in degrees C: ');
TC = [0:inc:100];
TR = (9/5)*TC + 32 + 459.67;
fprintf('Degrees Celsius     Degrees Rankin\n')
fprintf('----------------------------------\n')
fprintf('%8d %21.2f\n',[TC; TR])