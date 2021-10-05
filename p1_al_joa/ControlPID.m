%% CONTROL PID:
clc
clear
% declaramos variable de LaPlace y variable z
s = tf('s');
ts = 0.03;
Ts = ts;
z = tf('z',ts);
%planta y retardo
Km=7.7278e-2;
Tm=6.7051e-2;
Tf=0.2;
P = Km/(Tm*s+1)/(Tf*s+1);
delay = exp(-ts*s/2);
Pm = P*delay;
Pd = c2d(P,ts);

Fm = 60;
fpi = -10;
f=0.1;
b=1;

wo_p = fsolve(@(wo) -180+Fm-180/pi*angle(freqresp(Pm,wo)),1);
wo_pid = 1.4*wo_p;

fic = -180+Fm-angle(freqresp(Pm,wo_pid))*(180/pi);
fpd=fic-fpi;

fmax=(1-sind(fpd))/(1+sind(fpd));
if f>fmax
    f=fmax;
end

% parametros en serie:
Ac = 1/abs(freqresp(Pm, wo_pid));
D = ( (1/f-1)/(2*tand(fpd)) - sqrt( (((1/f-1)/(2*tand(fpd)))^2) - 1/f) )/wo_pid;
I = -1/tand(fpi)/wo_pid;
Kp = Ac*cosd(fpi)*sqrt((1+(f*wo_pid*D)^2)/(1+(wo_pid*D)^2));

% formato paralelo:

mu=1+(1-f)*D/I;
K=mu*Kp;
Td=((1/mu)-f)*D;
Ti=mu*I;
N=(1/(mu*f))-1;

% control y función en serie:
% C_pid = Kp*(1+I*s)*(1+D*s)/(I*s)/(1+f*D*s);
% % F_salida = minreal(C_pid*Pm/(C_pid+Pm));
% % F_error = minreal(C_pid*Pm/(1+C_pid*Pm));
% G = Pm * C_pid;

% control y funcion en paralelo
C_pid=K*(1+1/(Ti*s)+(Td*s)/(1+Td*s/N));
Cr_pid=K*(b+1/(Ti*s)+(Td*s)/(1+Td*s/N));

sa = (z-1)/(z*Ts);
Cd_pid = K*(1+1/(Ti*sa)+(Td*sa)/(1+Td*sa/N));

Crd_pid = Cd_pid;