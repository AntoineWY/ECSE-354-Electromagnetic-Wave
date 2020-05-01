
clear; close all;
%calculating the cutoff frequency
fc = 1*3e8/2/7.11e-3;
freq =fc:0.05e9:2*fc;
beta = zeros(length(freq));
cb_w = zeros(length(freq));
for k=1: length(freq)
    beta(k) = 2*pi*freq(k)/3e8*sqrt(1 - (fc^2 / freq(k)^2));
    cb_w(k) = beta(k)*3e8/2/pi/freq(k);
end
plot(freq,cb_w)
title('Plot of question 2.c')
%plot(freq, sqrt(1- fc^2 ./ freq.^2))

