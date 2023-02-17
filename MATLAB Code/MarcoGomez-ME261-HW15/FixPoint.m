function [root,iter] = FixPoint(es,guess,g)
ea = 1;
iter = 0;

while ea > es
    xn = g(guess);    
    ea = 100*abs((xn-guess)/xn);
    guess = xn;
    iter = iter+1;
end
root = xn;
end