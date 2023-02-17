% ME 261 Homework 23 Function
% Marco Gomez

function ar = calc_area_sim(a,b,n,f)
h = (b-a)/n;
x = linspace(a,b,n+1)';
y = f(x);
ar = (h/3)*(y(1) + 4*sum(y(2:2:n)) + 2*sum(y(3:2:n-1)) + y(n+1));
end