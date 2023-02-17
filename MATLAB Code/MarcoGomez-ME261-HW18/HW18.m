% ME 261 Homework 18
% Marco Gomez

clc
clear


x = linspace(0,1200,50);
y = zeros(1,50);
cp = @(x) (0.993403)+(1.671*(10^(-4))*x)+(9.7215*(10^(-8))*(x^2))-(9.5838*(10^(-11))*(x^3))+(1.952*(10^(-14))*(x^4));
for T= 1:length(x)
    y(T)= cp(x(T));
end
plot(x,y)
axis([0  1200  .95  1.25])
xlabel('Temperature(K)')
ylabel('Specific Heat (kJ/(kgK))')
title('Zero-pressure Specific Heat of Dry Air')
specifheat = 1.1;
p = 0.993403-specifheat;
r = roots([1.952*10^(-14) -9.5838*10^(-11) 9.7215*10^(-8) 1.671*10^(-4) p]);
for z= 1:length(r)
    if isreal(r(z)) && r(z)>0
        temp = r(z);
    end
end

fprintf('\nThe temperature corresponding to a specific heat of %.1f kJ/(kg K) is ', specifheat)
fprintf('%.2f K.\n', temp)