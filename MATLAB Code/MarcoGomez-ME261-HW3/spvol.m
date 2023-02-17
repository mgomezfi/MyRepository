clear
clc

innerrad = input('The inner radius is: ')
outerrad = input('The outer radius is: ')
Vol = ((4*(pi)*((outerrad)^3-(innerrad)^3))/3);
fprintf('The volume of the sphere is: %.2f\n', Vol)
