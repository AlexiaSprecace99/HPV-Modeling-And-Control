function CF_val = cost_function(Utry)

global lambda d d1 alfa1 delta1 delta2 delta3 delta4 cp cq cn cc ck ca ...
       alfa beta alfa2 alfa3 alfa4 alfa5 alfa6 alfa7 sigma1 sigma2 sigma3 ...
       sigma4 sigma5 sigma6 gamma1 gamma2 gamma3 gamma4 gamma5 gamma6 gamma7 ...
       theta1 theta2 theta3 theta4 theta5 Lvect C1 C2 C3 C4 C5 C6 B1 B2 N X0 Lvect1

%Lvect = Utry;
% 
% Lvect = Utry;
%delta4 = Utry(2,1:N);
t = 0:1:N-1;
Lvect = Sigmoid(Utry(1:3,1),t);
Lvect1 = Screening(Utry(4:9,1),t);

[~,X] = ode45('model_equations_opt',t,X0);

V = X(1);   % vaccinati
S = X(2);   %suscettibili
E = X(3);   %esposti senza sintomi
H = X(4);   %esposti con sintomi
P = X(5);   %individui infetti con infezione persistente
I1 = X(6);  %individui con CIN1
I2 = X(7);  %individui con CIN2
I3 = X(8);  %individui con CIN3
A = X(9);   %individui con cancro
R = X(10);  %guariti

%risolvo il modello con la funzione di ingresso tentativo Lvect
%CF_val = sum((C1*E^2)+(C2*H^2)+(C3*P^2)*(C4*I1^2)+(C5*I2^2)+(C6*I3^2)+(B1.*delta2.^2)+(B2.*delta4.^2));
CF_val = sum((C1.*(E.^2))+(C2.*(H.^2))+(C3.*(P.^2))*(C4.*(I1.^2))+(C5.*(I2.^2))+(C6.*(I3.^2))+(B1.*(Lvect.^2))+(B2.*(Lvect1.^2)));


