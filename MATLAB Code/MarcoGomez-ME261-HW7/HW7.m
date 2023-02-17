%Homework 7
clc
clear

guessnum = randi(100,1);
fprintf('I have a number between 1 and 1000.')
fprintf('\nCan you guess my number?')
userin = input('\nPlease type your first guess: ')
while guessnum ~= userin
    if userin > guessnum
        userin = input('\nToo high. Try again! Enter new guess:')
    elseif guessnum > userin
        userin = input('\nToo Low.  Try again! Enter new guess:')
    end
end
fprintf('\nExcellent! You guessed the correct number! (and the program ends)\n')