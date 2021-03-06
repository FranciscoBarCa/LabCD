 

clc 
clear
% para usar modelo analogico modificado ret=1
% para usar modelo analogico puro ret = 0
ret = 0;
% declaramos variable de LaPlace y variable z
s = tf('s');
ts = 0.5;
Ts = ts;
z = tf('z',ts);

% establecemos valores de la planta y retardo
Km=8.2897e-02;
Tm= 6.0718e-02;
Tf=0.2;
P = Km/(Tm*s+1)/(Tf*s+1);


delay = exp(-ts*s/2);
Pm = P*delay;
Pd = c2d(P,ts);

% establecemos parametros iniciales
Fm = 60;
Fa = tf(1,1);
% calculamos valores de corte
wo_p = fsolve(@(wo) -180+Fm-180/pi*angle(freqresp(Pm,wo)),1);
Ap = abs(freqresp(Pm, wo_p));
Kp = 1/Ap;

% declaramos el control proporcional. K -> C
K = Kp;
C = tf(K,1);
Cr = C;

Cd = c2d(C,ts,'zoh');
Crd = Cd;


% G = Pm*K;

%% CONTROL pid
% 
wo_pid = 1.4*wo_p;
Fpi=-10;
f=0.1;
I=-1/(wo_pid*tand(Fpi));
b=1;


Fic = -180+Fm-angle(freqresp(Pm,wo_pid))*(180/pi);
Fpd=Fic-Fpi;

Ac=1/abs(freqresp(Pm, wo_pid));

fmax=(1-sind(Fpd))/(1+sind(Fpd));
if f>fmax
    f=fmax;
end

% formato serie
D=((1/f-1)/(2*tand(Fpd))-sqrt(((1/f-1)/(2*(tand(Fpd))))^2-1/f))/wo_pid;
Kp=Ac*cosd(Fpi)*(sqrt(1+(f*wo_pid*D)^2))/(sqrt(1+(wo_pid*D)^2));

% formato paralelo
mu=1+(1-f)*D/I;
K=mu*Kp;
Td=((1/mu)-f)*D;
Ti=mu*I;
N=(1/(mu*f))-1;

C_pid=K*(1+1/(Ti*s)+(Td*s)/(1+Td*s/N));
Cr_pid=K*(b+1/(Ti*s)+(Td*s)/(1+Td*s/N));

sd=(z-1)/(z*Ts);
Cd=K*(1+1/(Ti*sd)+(Td*sd)/(1+Td*sd/N));
Crd=Cd;


