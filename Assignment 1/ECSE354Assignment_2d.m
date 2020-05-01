
clear; close all;
%calculating the cutoff frequency
fc = 1*3e8/2/7.11e-3;
freq =fc:0.05e9:2*fc;
betacb_w = zeros(length(freq));
vp_c = zeros(length(freq));
for k=1: length(freq)
    betacb_w(k) = sqrt(1 - (fc^2 / freq(k)^2));
    vp_c(k) = 1/betacb_w(k);
end
hold on
plot(freq,vp_c)
title('Plot of pahse velocity, question 2.d')

