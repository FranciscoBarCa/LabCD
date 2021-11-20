clc
clear
close all
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

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  PARAMETROS LINEALIZACION Y DISCRETIZACION DEL SISTEMA %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%__________________________________________________________________________
%                   PUNTO DE OPERCACION SIMULACION
%__________________________________________________________________________

vo =0; %velocidad de avance (m/s)
wo= 0; %velocidad angular de cabeceo (rad/s)
tho = 0; %ángulo de cabeceo (grados)
X0=[vo wo tho*pi/180]';
U0=0;
%__________________________________________________________________________
%                   FUNCION DE TRANSFERENCIA DEL MODELO LINEALIZADO
%__________________________________________________________________________

param(10) = 0; %Par de friccion del motor  Anulado para acelerar la simulacion
% Modelo linealizado en el punto X0
[matA,matB,matC,matD] = linmod('segway',X0,U0);
param(10)=Trmax;
%Planta en sistema de estado dx=Ax+Bu Y=Cx+Du
Pss = ss(matA,matB,matC,matD);
Pzpk = minreal(zpk(Pss));
set(Pzpk,'DisplayFormat','time constant');%No veo que haga nada pero simplente cambia como se representa por consola
%Funciones de transferencia para cada entrada/salida
Pv=Pzpk(1);
Pw=Pzpk(2);
Pth=Pzpk(3);
%__________________________________________________________________________
%                               DISCRETIZACION DEL MODELO
%__________________________________________________________________________

ts = 5e-3;
Pss_d=c2d(Pss, ts, 'zoh');
matAd=Pss_d.a;
matBd=Pss_d.b;
matCd=Pss_d.c;
matDd=Pss_d.d;
matDud=Pss_d.d;
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  REGULADOR  %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%__________________________________________________________________________
%                               MATRIZ K del control 
%__________________________________________________________________________

% OBJETIVO: MANTENER EL PUNTO DE EQUILIBRIO % 
% En el modelo incremental todas las variables de estado valen 0 en el 
% punto de equilibrio 
% Estrategia de control: U=-K*X
% Se aplica sobre el modelo incremental en tiempo discreto 
% % X[k+l] = Ad*X[k] +Bd*U[k]= Ad*X[k] +Bd*K*X[k]=(Ad-Bd*K)*X[k]
% La matriz de estado en lazo cerrado es Ad—Bd*K 
% Se fijan las dinámicas en lazo cerrado para que el sistema retorne al 
% punto de equilibrio de forma rápida y bien amortigada 
% Asignación de polos en lazo cerrado 
% Polos del en lazo abierto y en tiempo continuo 
polos_la=eig(matA);
w_la=max(polos_la);% pulsación del polo inestable 
% Polos en lazo cerrado: configuración de Butterworth 
wn=0.461*w_la;
seta=0.7;
polos_ad=-5.55*wn; %polo adicional
polos_lc=wn*[-seta+sqrt(1-seta^2)*1j, -seta-sqrt(1-seta^2)*1j, polos_ad].';
% Polos en tiempo discreto 
polosd_lc=exp(polos_lc*ts);% z=e^(s*ts)

% Cálculo de la matriz K del control 
Kcd=place (matAd , matBd , polosd_lc) ; 
%__________________________________________________________________________
%                               Análisis de la robustez 
%__________________________________________________________________________

%
%Paux=ss (matAd , matBd , eye(3) , zeros (3,1) , ts); ???
Paux=ss (matAd , matBd , matCd , matDd , ts);

Ubase=8.5; 
Ybase =[0.3 400*pi/180 15*pi/180]; 
analiza_robustez_SFR(Paux, Kcd , Ubase , Ybase)













