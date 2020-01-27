function [Vi] = incidentVoltage(Vi0,thetai0,w,alpha,beta,z,t)

    Vi = Vi0.*exp(-alpha.*z).*cos(w.*t - beta.*z + thetai0);



end