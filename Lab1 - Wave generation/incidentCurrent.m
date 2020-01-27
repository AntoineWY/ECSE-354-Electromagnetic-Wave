function [Ii] = incidentCurrent(Vi0,thetai0,w,alpha,beta,z,t,Z0)

    Vi = incidentVoltage(Vi0,thetai0,w,alpha,beta,z,t);
    Ii = real(Vi / Z0);

end