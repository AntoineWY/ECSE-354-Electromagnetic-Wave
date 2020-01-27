
T = 1e-9;
t = 0:0.05*T:T;
z = -1:0.01:0;
[z1,t1] = meshgrid(z,t);
f = 1/T;
Vi0 = 1;
Vr0 = 1.* Vi0;
thetai0 = 0;
w = 2*pi*f;


% alpha = 0.55;
% beta = 35;
% Z0 = 36.5 - 0.75j;

R = 170;
G = 750e-6;
C = 40e-12;
L = 0.35e-6;
gamma = sqrt((R+1j.*w*L)*(G+ 1j*w*C));

alpha = 1;
beta = imag(gamma);

Z0 = sqrt((R+1j*w*L)/(G+1j*w*C));

choice = menu('What do you want to see?','forward wave','backward wave','both');

Vi = incidentVoltage(Vi0,thetai0,w,alpha,beta,z1,t1);
Ii = incidentCurrent(Vi0,thetai0,w,alpha,beta,z1,t1,Z0);

Vb = BWVoltage(Vr0,thetai0,w,alpha,beta,z1,t1);
Ib = BWCurrent(Vr0,thetai0,w,alpha,beta,z1,t1,Z0);


for k=1: length(t)
    
    if(choice == 0)
        plot(z,Vi(k,:),'b.');
        hold on;

        plot(z,10*Ii(k,:), 'r-');
        hold off;
    else if(choice == 1)
        plot(z,Vb(k,:),'b.');
        hold on;

        plot(z,10*Ib(k,:), 'r-');
        hold off;   
    else
        plot(z,Vb(k,:)+ Vi(k,:),'b.');
        hold on;

        plot(z,10*(Ib(k,:)+Ii(k,:)), 'r-');
        hold off;
    end

    plot(z,Vb(k,:)+ Vi(k,:),'b.');
    hold on;
    
    plot(z,10*(Ib(k,:)+Ii(k,:)), 'r-');
    hold off;
    
    xlabel('z[m]');
    ylabel('Vi(z,t)[V], 10*Ii(z,t)[mA]');
    
    title('instanteous signals - on a lossy transmission line');
    
    legend('Vi(z,t)','Ii(z,t)' );
    
    ylim(max(max(max(Vi)), max(max(10*10*Ii)))*1.5*[-1,1]);
        M(k) = getframe;
    end
end