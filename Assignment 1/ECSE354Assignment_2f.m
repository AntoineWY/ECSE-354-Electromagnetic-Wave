
clear; close all;
%calculating the cutoff frequency
fc = 1*3e8/2/7.11e-3;
freq =fc:0.05e9:2*fc;
mu = 4e-7*pi;
sigma = 4.1e7;
Rs = zeros(length(freq));
for k=1: length(freq)
    Rs(k) = sqrt(pi*mu*freq(k)/sigma);
end
plot(freq,Rs)
title('Plot of Rs, question 2.f')

