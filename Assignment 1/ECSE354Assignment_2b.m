
clear; close all;
%calculating the cutoff frequency
fc = 1*3e8/2/7.11e-3;

freq =fc:0.05e9:2*fc;
cos_incident = zeros(length(freq));
incident = zeros(length(freq));

for k=1: length(freq)
    cos_incident(k) = (pi/7.11e-3)/(2*pi*freq(k)*3.33e-9);
    incident(k) = acosd(cos_incident(k));
end
title('Plot of question 2.b')
plot(freq,incident)

