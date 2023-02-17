%Marco A. Gomez Fierro


%Exam 1 M1C Question 1

clc
clear
 
Faren = 44:12:113;
Faren(7) = 113;
TC = (Faren-32).*(5/9);
Dens = (1.0001)+(6.9262*10^(-5)*TC)-(7.9183*10^(-6)*TC.^(2))+(6.2124*10^(-8)*(TC).^3);

plot(TC,Dens)
xlabel('Temperature(C)')
ylabel('Density(g/cm^3)')

TableColum1 = TC';
TableColum = Dens';
TableColum1 = round(TableColum1,3);
fprintf('Temperature    Density')
fprintf('\n----------------------\n')
TableColum1(:,2) = TableColum;
disp(TableColum1)