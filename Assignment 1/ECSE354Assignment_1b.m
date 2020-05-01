
clear; close all;
freq =0:0.05e9:10e9;
nb = 377/sqrt(3);
na = 377;

reCoefficient1 = 0.267949;
beta = 5.777e-9;
impedence = zeros(length(freq));
reCoefficient2 = zeros(length(freq));
for k=1: length(freq)
    impedence(k) = nb .* (1+reCoefficient1.*exp(-2j.*beta.*(2*pi).*freq(k)...
        .*0.01))./(1-reCoefficient1.*exp(-2j.*beta.*(2*pi).*freq(k).*0.01));
    reCoefficient2(k) = abs((impedence(k) - na)/(impedence(k) + na));
end




plot(freq,reCoefficient2)
title('Plot of reflection amplitude, question 1.b')
%xlabel('0 < \thetai < 90 (degree)') 
%ylabel('\thetat (degree)') 



