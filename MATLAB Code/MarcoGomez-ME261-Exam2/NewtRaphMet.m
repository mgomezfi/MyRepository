
function [root,iter] = NewtRaphMet(a,b,f,df)
es1 = a;
xo = b;
ea = 1;
iter = 0;

while ea > es1
    xn = xo-f(xo)/(df(xo));
    ea = 100*abs((xn-xo)/xn);
    xo = xn;
    iter = iter+1;
end
root = xn;
end