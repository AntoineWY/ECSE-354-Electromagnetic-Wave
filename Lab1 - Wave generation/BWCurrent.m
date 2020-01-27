function [Ib] = BWCurrent(Vr0,thetai0,w,alpha,beta,z,t,Z0)

    Vb = BWVoltage(Vr0,thetai0,w,alpha,beta,z,t);
    Ib = real(Vb / -Z0);

end