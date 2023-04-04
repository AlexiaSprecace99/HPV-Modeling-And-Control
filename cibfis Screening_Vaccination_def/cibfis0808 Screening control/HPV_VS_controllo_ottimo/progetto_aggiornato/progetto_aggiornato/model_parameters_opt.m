
%%% model parameters

% lambda = sym('lambda'); %tasso annuale di reclutamento della popolazione suscettibile 
% d = sym ('d'); %tasso annuale di morte naturale
% d1 = sym('d1'); %tasso annuale di morte per cancro
% alfa1 = sym('alfa1'); %tasso di contagio
% delta1 = sym('delta1'); %tasso annuale di inefficacia del vaccino
% delta2 = sym('delta2'); %tasso annuale di vaccinazione
% delta4 = sym('delta4'); %tasso annuale di rivaccinazione
% delta3 = sym('delta3'); %tasso relativo di infezione per R rispetto ad S
% cp = sym('cp'); %effetto screening
% cq = sym('cq'); %frequenza annuale screening
% cn = sym('cn'); %tasso annuale con cui le donne (uomini) acquisiscono nuovi partner sessuali
% ck = sym('ck'); %probabilità di trasmettere l'HPV da donna (uomo) a uomo (donna)
% cc = sym('cc'); %efficacia del preservativo
% ca = sym('ca'); %disponibilità del preservativo
% alfa = sym('alfa'); %effetto negativo dei farmaci contraccettivi
% beta = sym('beta'); %effetto negativo del fumo
% alfa2 = sym('alfa2'); %tasso di progressione da E a H (annuale)
% alfa3 = sym('alfa3'); %tasso di progressione da H a P
% alfa4 = sym('alfa4'); %tasso di progressione da P a I1
% alfa5 = sym('alfa5'); %tasso di progressione da I1 a I2
% alfa6 = sym('alfa6'); %tasso di progressione da I2 a I3
% alfa7 = sym('alfa7'); %tasso di progressione da I3 a A
% 
% sigma1 = sym('sigma1'); %tasso di guarigione da E a R(annuale)
% sigma2 = sym('sigma2'); %tasso di guarigione da H a E (annuale)
% sigma3 = sym('sigma3'); %tasso di progressione da P a H
% sigma4 = sym('sigma4'); %tasso di progressione da I1 a P
% sigma5 = sym('sigma5'); %tasso di progressione da I2 a I1
% sigma6 = sym('sigma6'); %tasso di progressione da I3 a I2
% 
% gamma1= sym('gamma1'); %effetto dei farmaci sulla guarigione
% gamma2= sym('gamma2'); %effetto dei farmaci sulla guarigione
% gamma3= sym('gamma3'); %effetto dei farmaci sulla guarigione
% gamma4= sym('gamma4'); %effetto dei farmaci sulla guarigione
% gamma5= sym('gamma5'); %effetto dei farmaci sulla guarigione
% gamma6= sym('gamma6'); %effetto dei farmaci sulla guarigione
% gamma7= sym('gamma7'); %effetto dei farmaci sulla guarigione
% 
% theta1 = sym('theta1'); %parametro relativo che registra l'infettività 
%                         %degli individui nella classe H relativo ad E
% theta2 = sym('theta2'); %parametro relativo che registra l'infettività 
%                         %degli individui nella classe P relativo ad E
% theta3 = sym('theta3'); %parametro relativo che registra l'infettività 
%                         %degli individui nella classe I1 relativo ad E
% theta4 = sym('theta4'); %parametro relativo che registra l'infettività 
%                         %degli individui nella classe I2 relativo ad E
% theta5 = sym('theta5'); %parametro relativo che registra l'infettività 
%                         %degli individui nella classe I3 relativo ad E
                        
%%% model parameters                                               
alfa1=0;                  
lambda = 288802;
d = 0.0162;
d1 = 0.01;
delta1 = 0.01; %0.01
delta2 = 0.87;
delta4 = 0.27;
delta3 = 0.3;
cp = 0.9;
%cq = 0.4;
cn = 2;
ck = 0.5;
cc = 0.92;
ca = 0.3;   
alfa = 1.2;
beta = 1;
alfa2 = 1.5; %0.5
alfa3 = 0.005;
alfa4 = 0.1;
alfa5 = 0.02;
alfa6 = 0.04;
alfa7 = 0.08;

sigma1 = 0.99;
sigma2 = 9*10^-4;
sigma3 = 0.5;
sigma4 = 1.9*10^-7;
sigma5 = 1.9*10^-7;
sigma6 = 1.9*10^-7;

gamma1= 1.5;
gamma2= 1.5;
gamma3= 1.2;
gamma4= 1.1;
gamma5= 1.05;
gamma6= 1.03;
gamma7= 1.01;

theta1 = 1;
theta2 = 0.8;
theta3 = 0.7;
theta4 = 0.6;
theta5 = 0.5;

C1 = 4.5*10^-2;
C2 = 10^-7;
C3 = 10^-4;
C4 = 10^-5;
C5 = 2*10^-4;
C6 = 10^-4; 
B1 = 8.3*10^8;
B2 = 4*10^8;


%%% initial condition
X0 = [3.2607*10^6 3.2212*10^5 4.2204*10^4 1.1162*10^7 4*10^4 1.15*10^5 4.15*10^4 1.68*10^4 1.290*10^3 6.3*10^3];
