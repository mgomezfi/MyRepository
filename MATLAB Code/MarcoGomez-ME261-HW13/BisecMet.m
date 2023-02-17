%ME 261 Homework 13 Algorithm for Bisection Method



function [root,iter] = BisecMet(a,b,c,d,e)
yl1 = a;
yu1 = b;
es1 = c;
maxn1 = d;
func1 = e;
g = 9.81;
ea = 1;

ym = (yl1+yu1)/2;
old = (yl1+yu1)/2;
iter = 0;

while ea > es1 && iter < maxn1
    fxl = func1(yl1);
    fxml = func1(ym);
    if (fxl*fxml) < 0
        yu1 = ym;
    elseif (fxl*fxml) > 0
        yl1 = ym;
    elseif (fxl*fxml) == 0
        root = ym;
        break
    end
    
    ym = (yl1+yu1)/2;
    ea = 100*abs((ym-old)/ym);
    old = ym;
    root = ym;
    iter = iter+1;
end
aswr = [root iter];
end


