%ME 261 Final Exam Problem 2 RK4 Method


function rk4 = RK4Met(h,x,f,ref)
rk4(1) = ref;
n = length(x);
for i=1:n-1
    k1 = f(x(i),rk4(i));
    k2 = f(x(i)+0.5*h,rk4(i)+0.5*h*k1);
    k3 = f((x(i)+0.5*h),(rk4(i)+0.5*h*k2));
    k4 = f((x(i)+h),(rk4(i)+h*k3));
    rk4(i+1) = rk4(i) + (h/6)*(k1+2*k2+2*k3+k4);
end
end