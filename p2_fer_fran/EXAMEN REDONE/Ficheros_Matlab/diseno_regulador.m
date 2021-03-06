clear
%clc
format short e
s=tf('s');
% Período de muestreo
ts = 5e-3;
Ts=ts;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%  PARAMETROS  %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Los parámetros mecánicos están referidos al eje de la rueda
% Gravedad (m/s^2)
g=9.81;
%%%%%%%%%
% Motor %
%%%%%%%%%
% Resistencia en ohmios
Rm=4.5;
% Relacion de engranajes
n=48;
% Constante electrica (V.s)
Ke=0.01; 
% Constante mecanica (N.m/A)

Kt=Ke;
% Momento de inercia del motor (kg.m^2)
Im=3.75e-3;
% Par máximo de friccion (Nm)
Trmax=0.05;
% Friccion viscosa (N.m.s/rad)
Dm=0.0142;
%%%%%%%%%%
% Segway %
%%%%%%%%%%
% Masa del chasis (kg)
M = 0.6;
% Masa de la rueda + rotor (kg)
m = 0.034;
% Momento de inercia de cabeceo (kg.m^2)
Ith = 1.425e-3;
% Momento de inercia de la rueda + rotor (kg.m^2)
Imr = 3.2e-6+Im;
% Distancia vertical al c.d.g. desde el eje de la rueda (m)
h = 0.073;
% Distancia entre ruedas (m)
W = 0.15;
% Radio de la rueda (m)
R = 81.6e-3/2;
% Vector de parametros
param=[M m Ith Imr h W R Ke Rm Trmax Dm n];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Otros parametros del control %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instante inicial de control (ms)
time_start = 1;
% Factor de filtrado de la medida de la velocidad
alfa1=0.8;
% Factor de filtrado en la calibración del giroscopo
alfa2=0.999;
% offset inicial del giroscopo
gyro0=615;
% Peso del giroscopo en el filtro complementario
Wfc=0.98;
% Frecuencia de la señal sonora (Hz)
sound_freq = 440;
% Duracion de la señal sonora (ms)
sound_dur =	500;


%%Obtención modelo linealizado
param(10)=0;

uo=0;
xo=zeros(3,1);

[matA, matB, matC, matD]=linmod('segway', xo, uo);


Pss=ss(matA, matB, matC, matD);
Pzpk=minreal(zpk(Pss));
set(Pzpk, 'DisplayFormat', 'timeconstant')

Pv=Pzpk(1);
Pw=Pzpk(2);
Pth=Pzpk(3);


%%Discretización planta: 


Pss_d=c2d(Pss, ts);
Ad=Pss_d.a;
Bd=Pss_d.b;
Cd=Pss_d.c(1,:);
Dd=Pss_d.d(1,:);

%%Obtención matriz Kcd para polos polosd_lc
polos_la=eig(matA);
w_la=max(polos_la);

wn=1.1*w_la; %parámetros par polos complejos conjugados
seta=0.7;

% TEORIA:
% Butterworth tercer orden -> seta = 0.5 (dos polos complejos conjugados) y
% uno real p=-wn
% Butterworth segundo orden -> seta = 0.7
% Amortiguamiento critico -> seta = 1

polos_lc=wn*[-seta+sqrt(1-seta^2)*1j, -seta-sqrt(1-seta^2)*1j].';

polos_ad=-5*wn; %polo extra (lo alejamos)

polosd_lc=exp([polos_lc; polos_ad]*ts);

Kcd=place(Ad, Bd, polosd_lc);

%%Configuración simulación

th0=5;
X0 = [0, 0, th0*pi/180]';


param(10)=0; %por si acaso hay que poner par de rozamiento máximo

sim('SEGWAY_SIM_SFR.slx');