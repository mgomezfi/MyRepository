%ME 261 Final Exam Problem 1 Function

function Q = TrapezoidalRule(x,y)
total = 0;
n = length(x);
for i = 2:n
    tem = ((x(i)-x(i-1))*((y(i-1)+y(i))./2));
    tot = total+tem;
    total = tot;
end
Q = total;
end