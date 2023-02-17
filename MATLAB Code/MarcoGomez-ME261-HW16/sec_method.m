function [root,iter] = sec_method(es,x1,x2,g)
ea = 1;
iter = 0;

while ea > es
    xn = x2-g(x2)*(x2-x1)/(g(x2)-g(x1));    
    ea = 100*abs((xn-x2)/xn);
    x1 = x2;
    x2 = xn;
    iter = iter+1;
end
root = xn;
end