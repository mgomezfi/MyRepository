% ME 261 Homework 24
% Marco Gomez

clc
clear

 x = [0 .52 1.04 1.75 2.37 3.25 3.83];%(time (t,s))
 y = [153 185 208 249 261 271 273];
 xx = linspace(0,3.83,30);
 yy = spline(x,y,xx);
 vel = differentiation(xx,yy);
 tiledlayout(2,1);
 nexttile
 plot(xx,vel)
 axis([0 4 -50 100])
 yticks([-50 0 50 100])
 title('Jet Fighters Velocity')
 ylabel('Velocity (m/s)')
 accel = differentiation(xx,vel);
 nexttile
 plot(xx,accel)
 axis([0 4 -200 100])
 yticks([-200 -100 0 100])
 title('Jet Fighters Acceleration')
 ylabel('Acceleration (m/s^2)')