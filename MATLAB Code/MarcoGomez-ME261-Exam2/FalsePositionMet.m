 
function [root,iter] = FalsePositonMet(a,b,c,d)
es1 = a;
xl1 = b;
xu1 = c;
ea = 1;


old = (xl1+xu1)/2;
iter = 0;

while ea > es1
    xr = (xl1*d(xu1)-xu1*d(xl1))/(d(xu1)-d(xl1));
    if (d(xl1)*d(xr)) < 0
        xu1 = xr;
    elseif (d(xl1)*d(xr)) > 0
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
end