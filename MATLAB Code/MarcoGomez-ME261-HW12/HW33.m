clc
clear

value = input('Enter the value of x to compute sin(x):');
ES = (.5*10^(-3));
itera = 0;
n = 1;
apprx = 0;
EA = 1;
pwr = 1;

while EA > ES
    itera = itera+1;
    while pwr >= 1
        if mod(itera,2) == 0
            apprx = apprx+(value^pwr)/factorial(pwr);
            pwr = pwr-2;
        else if mod(itera,2) == 1
                apprx = apprx-((value^pwr)/factorial(pwr));
                pwr = pwr-2;
            end
        end
    end
    n = n+2;
    EA = abs((apprx-(sin(value))/apprx)*100);
    pwr=n;
end

fprintf('sin(%.2f) = ', value);
fprintf('%.6f\n', apprx);
fprintf('It took %4f iterations to converge!\n', itera);