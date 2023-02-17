%Marco Gomez HW11
%IMPRTANT= In the following function structure that was directed to follow it will return an 'ans' variable if
%there is no ';' arter the function is called or if the function arm_prop
%was just defined as 'function arm_prop(x)'

function [gm,ra,hm] = arm_prop(x)
gm = geomean(x);
ra = RMSavg(x);
hm = Harmavg(x);
fprintf('%.5f, %.5f, %.5f=> These are the outputs of the function\n',[gm,ra,hm])
fprintf('%.5f => geometric mean, %.5f => RMS average, %.5f => harmonic mean\n',[gm,ra,hm])
end

function gm = geomean(x)
n = length(x);
gm = (prod(x).^(1/n));
end

function rm = RMSavg(x)
n = length(x);
rm = sqrt((1/n).*(sum(x.^2)));
end

function hm = Harmavg(x)
n = length(x);
hm = (n./(sum(1./x)));
end

