%Homework #6
clc
clear

t = linspace(-10,70,100);


for i = 1:100
    if t(i) < 0
        v(i)=0;
    elseif t(i) < 8
        v(i)=10*(t(i)^2)-0.5*(t(i));
    elseif t(i) < 16
        v(i)=676-5*t(i);
    elseif t(i) < 26
        v(i)=20+36*t(i)+12*(t(i)-16)^2;
    elseif t(i) >= 26
        v(i)=2156*(exp(-0.1*(t(i)-26)));
    else
        v(i)=0;
    end
end

plot(t,v,'b')
title('Rocket Velocity Profile')
xlabel('Time(s)')
ylabel('Velocity(m/s)')
