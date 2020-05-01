
clear; close all;
%calculating the cutoff frequency
fc = 1*3e8/2/7.11e-3;
freq =fc:0.05e9:2*fc;
% vg = dw/db 
% the formula is c*sqrt(1 - (fc^2 / freq(k)^2))
vg_c = zeros(length(freq));
for k=1: length(freq)
    vg_c(k) = sqrt(1 - (fc^2 / freq(k)^2));
end
hold on
plot(freq,vg_c)
title('Plot of group velocity, question 2.e')

