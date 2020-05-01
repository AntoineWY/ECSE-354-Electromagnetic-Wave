
clear; close all;
%calculating the cutoff frequency
fc = 1*3e8/2/7.11e-3;
freq =fc:0.05e9:2*fc;

mu = 4e-7*pi;
sigma = 4.1e7;
Rs = zeros(length(freq));
alpha = zeros(length(freq));
vg = zeros(length(freq));
for k=1: length(freq)
    Rs(k) = sqrt(pi*mu*freq(k)/sigma);
    vg(k) = 3e8*sqrt(1 - (fc^2 / freq(k)^2));
    
    alpha(k) = Rs(k)*(1/3.56e-3+2*(fc^2 / freq(k)^2)/7.11e-3)/ mu/ vg(k);
end
plot(freq,alpha)
title('Plot of alpha, question 2.g')

