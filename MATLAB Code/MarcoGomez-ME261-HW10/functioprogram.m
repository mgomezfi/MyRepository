%Marco Gomez HW10
%Main Program

clc
clear

angletheta = 30;
w1 = .3;
w2 = .5;
L = 12;

w1vec = [0 w1 0];
w2vec = [0 0 w2];
wvect = [0, w1, w2];
angacc = cros_prod(w1vec,w2vec);
dist = [L*cosd(angletheta) L*sind(angletheta) 0];
acce = cros_prod(angacc,dist)+cros_prod(wvect,cros_prod(wvect,dist));
fprintf('The calculated acceleration is: [%.3f, %.3f, %.3f]', acce)
