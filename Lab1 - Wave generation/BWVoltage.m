function [Vb] = BWVoltage(Vr0,thetai0,w,alpha,beta,z,t)

    Vb = Vr0.*exp(alpha.*z).*cos(w.*t + beta.*z + thetai0);



end