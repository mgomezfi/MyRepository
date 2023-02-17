clc
clear

count = 0
n = 1
value = input('\nEnter the value of x to compute sin(x): \n');
EA = 1
ES = 0
predic = 0
prevpredic = 0
placehold = 1

while EA > ES
    count = count+1
    while placehold >= 1
        if placehold == 1
            predic = value
        else if mod(count,2) == 0
            predic = predic-((value.^(placehold))/(factorial(placehold)))           
            placehold = placehold-2
        else
            predic = predic+((value.^(placehold))/(factorial(placehold)))
            placehold = placehold-2
        end
    end
    
    
    EA = abs(((sin(value)-predic)./sin(value).*100)
    ES = (.5*10^(-3))
    n = n+2
    prevpredic = predic
    predic = 0
    placehold = n
    count = count+1
end
fprintf('sin(%.2f) = ', value);
fprintf('%.6f\n', predic);
fprintf('It took %4f iterations to converge!\n', count);