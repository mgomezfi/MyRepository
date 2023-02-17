% Marco Gomez
% ME 261 Exam 2
%Problem 1 False Position Method

function [root,iter] = FalPosMet(a,b,c,d)
es1 = a;
xl1 = b;
xu1 = c;
ea = 1;


old = (xl1+xu1)/2;
iter = 0;

while ea > es1
    xr = (xl1*func1(xu1)-xu1*func1(xl1))/(func1(xu1)-func1(xl1));
    if (func1(xl1)*func1(xr)) < 0
        xu1 = xr;
    elseif (func1(xl1)*func1(xr)) > 0
        xl1 = xr;
    elseif (fxl*fxml) == 0
        root = xr;
        break
    end
    
    ea = 100*abs((xr-old)/xr);
    old = xr;
    root = xr;
    iter = iter+1;
end
aswr = [root iter];
end