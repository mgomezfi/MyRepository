% ME 261 Homework 25 RK4 Function
% Marco Gomez

function rk4y = RK4(h,x,f)
rk4y(1) = 1;
n = length(x);
for i=1:n-1
    k1 = f(x(i),rk4y(i));
    k2 = f(x(i)+0.5*h,rk4y(i)+0.5*h*k1);
    k3 = f((x(i)+0.5*h),(rk4y(i)+0.5*h*k2));
    k4 = f((x(i)+h),(rk4y(i)+h*k3));
    rk4y(i+1) = rk4y(i) + (h/6)*(k1+2*k2+2*k3+k4);
% fprintf(fid,'%7d %7.2f %7.3f %7.3f',i, t(i), k1, k2);
% fprintf(fid,' %7.3f %7.3f %7.3f \n', k3, k4, rk4y(i));
end
end