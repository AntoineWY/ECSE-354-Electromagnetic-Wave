
clear; close all;
%calculating the cutoff frequency
fc = 1*3e8/2/7.11e-3;
freq =fc:0.05e9:2*fc;
beta = zeros(length(freq));
Rs = zeros(length(freq));
alpha = zeros(length(freq));
vg = zeros(length(freq));
tan_delta = zeros(length(freq));
mu = 4e-7*pi;
sigma = 4.1e7;
for k=1: length(freq)
    beta(k) = 2*pi*freq(k)/3e8*sqrt(1 - (fc^2 / freq(k)^2));
    
    Rs(k) = sqrt(pi*mu*freq(k)/sigma);
    vg(k) = 3e8*sqrt(1 - (fc^2 / freq(k)^2));
    alpha(k) = Rs(k)*(1/3.56e-3+2*(fc^2 / freq(k)^2)/7.11e-3)   / mu / vg(k);
    % Good dielectric approximation links alpha, beta and loss tangent
    % together
    tan_delta(k) = 2*alpha(k)/beta(k);
end
plot(freq,tan_delta)
title('Plot of question 2.h')


