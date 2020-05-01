clear; close all;
freq =0:0.02e9:10e9;
nb = 377/sqrt(3);
na = 377;

reCoefficient1 = 0.267949;
betaB = 5.777e-9;
betaA = 3.333e-9;
impedenceB1 = zeros(length(freq));
impedenceB2 = zeros(length(freq));

impedenceA = zeros(length(freq));
reCoefficient2 = zeros(length(freq));
reCoefficient3 = zeros(length(freq));
reCoefficient4 = zeros(length(freq));
for k=1: length(freq)
    impedenceB1(k) = nb .* (1+reCoefficient1.*exp(-2j.*betaB.*(2*pi).*freq(k).*0.01))./(1-reCoefficient1.*exp(-2j.*betaB.*(2*pi).*freq(k).*0.01));
    reCoefficient2(k) = (impedenceB1(k) - na)/(impedenceB1(k) + na);
    impedenceA(k) = na .* (1+reCoefficient2(k).*exp(-2j.*betaA.*(2*pi).*freq(k).*0.017))./(1-reCoefficient2(k).*exp(-2j.*betaA.*(2*pi).*freq(k).*0.017));
    reCoefficient3(k) = (impedenceA(k) - nb)/(impedenceA(k) + nb);
    impedenceB2(k) = nb .* (1+reCoefficient3(k).*exp(-2j.*betaB.*(2*pi).*freq(k).*0.01))./(1-reCoefficient3(k).*exp(-2j.*betaB.*(2*pi).*freq(k).*0.01));
    reCoefficient4(k) = (impedenceB2(k) - na)/(impedenceB2(k) + na);
    
    % from this point we are adding a additional AB layer on to ABABA
    % structure in Question d
    impedenceA(k) = na .* (1+reCoefficient4(k).*exp(-2j.*betaA.*(2*pi).*freq(k).*0.017))./(1-reCoefficient4(k).*exp(-2j.*betaA.*(2*pi).*freq(k).*0.017));
    reCoefficient3(k) = (impedenceA(k) - nb)/(impedenceA(k) + nb);
    impedenceB2(k) = nb .* (1+reCoefficient3(k).*exp(-2j.*betaB.*(2*pi).*freq(k).*0.01))./(1-reCoefficient3(k).*exp(-2j.*betaB.*(2*pi).*freq(k).*0.01));
    reCoefficient4(k) = abs((impedenceB2(k) - na)/(impedenceB2(k) + na));
end
plot(freq,reCoefficient4)
title('Plot of reflection amplitude, question 1.e')