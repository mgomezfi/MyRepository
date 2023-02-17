clc
clear

fprintf('This program calculates the taxes for Australia.')
income = input('\nEnter the persons total income: ');
fprintf('\n\nFor an income of $%.2f the taxes are:', income)
fprintf('\n-----------------------------------------\n')
inctax = 0;
medtax = 0;
if income <= 6000
    inctax = 0;
    medtax = income*0.015;
elseif income > 6000 && income <= 20000
    inctax = (income-6000)*.17;
    medtax = income*0.015;
elseif income > 20000 && income <= 50000
    inctax = ((income-20000)*.30)+2380;
    medtax = income*0.015;
elseif income > 50000 && income <= 60000
    inctax = ((income-50000)*.42)+11380;
    medtax = income*0.015;
else
    inctax = ((income-60000)*.47)+15580;
    medtax = income*0.015;
end
total = inctax+medtax;
fprintf('Medicare Levy=>  $%.2f\n', medtax)
fprintf('Income Tax =>  $%.2f', inctax)
fprintf('\n-----------------------------------------\n')
fprintf('Total Tax =>  $%.2f\n', total)