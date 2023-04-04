clear
close all
clc


syms V S E H P I1 I2 I3 A R
syms d d1 alfa1 delta1 delta2 delta4 delta3 cp cq cn ck cc ca alfa beta alfa2 alfa3 lambda sigma1 N
syms alfa4 alfa5 alfa6 alfa7 sigma2 sigma3 sigma4 sigma5 sigma6 gamma1 gamma2 gamma3 gamma4 gamma5 gamma6 gamma7
syms theta1 theta2 theta3 theta4 theta5 a1 a2 a3 a4 a5 a6 a7 a8 a9 M a10 D1 D2 D3 D4 D5 D6 M1

N=lambda/d;
alfa1 = (beta*alfa*cn*ck*(1-cc*ca)*(E+theta1*H+theta2*P+theta3*I1+theta4*I2+theta5*I3))/N;
PHI=[alfa1*S,0,0,0,0,0,0,0,0,0];
vars=[E,H,P,I3,I2,I1,A,S,R,V];
J=jacobian(PHI,vars);
Dphi=subs(J,vars,[0,0,0,0,0,0,0,lambda*(d + delta1)/(d*delta1 + d*delta2 + d*delta4 + d^2),0,lambda*(delta2 + delta4)/(d*delta1 + d*delta2 + d*delta4 + d^2)]);
    
eqn3= delta3*alfa1*R+sigma2*H-(alfa2+cp*cq*gamma1*sigma1+d)*E;
eqn4 = alfa2*E+sigma3*P-(sigma2+gamma2*sigma2+alfa3+d)*H;
eqn5 = alfa3*H +sigma4*I1 -(alfa4+gamma3*sigma3+sigma3+d)*P;
eqn6 = alfa4*P+sigma5*I2-(alfa5+gamma4*sigma4+sigma4+d)*I1;
eqn7 = alfa5*I1+sigma6*I3-(sigma5+gamma5*sigma5+alfa6+d)*I2;
eqn8 = alfa6*I2-(sigma6+gamma6*sigma6+alfa7+d)*I3;
eqn9 = alfa7*I3-(gamma7+d+d1)*A;
eqn2 = lambda+delta1*V-(delta2+delta4+alfa1+d)*S;
eqn10= cp*cq*gamma1*sigma1*E+gamma2*sigma2*H+gamma3*sigma3*P+gamma4*sigma4*I1+gamma5*sigma5*I2+gamma6*sigma6*I3+gamma7*A-(delta3*alfa1+d)*R;
eqn1 = delta2*S+delta4*S-(d+delta1)*V;
Gamma=-[eqn3,eqn4,eqn5,eqn6,eqn7,eqn8,eqn9,eqn2,eqn10,eqn1];
J1=jacobian(Gamma,vars);
Dgamma=subs(J1,vars,[0,0,0,0,0,0,0,lambda*(d + delta1)/(d*delta1 + d*delta2 + d*delta4 + d^2),0,lambda*(delta2 + delta4)/(d*delta1 + d*delta2 + d*delta4 + d^2)]);
F=Dphi(1:6,1:6);
F1=subs(F,d+delta1,a1);
F1=simplify(F1);
F2=subs(F1,[delta2+delta4+d,alfa2+cp*cq*gamma1*sigma1+d,sigma2+gamma2*sigma2+alfa3+d,alfa4+gamma3*sigma3+sigma3+d,alfa5+gamma4*sigma4+sigma4+d,sigma5+gamma5*sigma5+alfa6+d,sigma6+gamma6*sigma6+alfa7+d,gamma7+d+d1],[a2,a3,a4,a5,a6,a7,a8,a9]);
F3=subs(F2,beta*alfa*cn*ck*(1-cc*ca),M);
Fdef=subs(F3,M*a1/(a2+delta1),a10);
V=Dgamma(1:6,1:6)
Vdef=subs(V,[delta2+delta4+d,alfa2+cp*cq*gamma1*sigma1+d,sigma2+gamma2*sigma2+alfa3+d,alfa4+gamma3*sigma3+sigma3+d,alfa5+gamma4*sigma4+sigma4+d,sigma5+gamma5*sigma5+alfa6+d,sigma6+gamma6*sigma6+alfa7+d,gamma7+d+d1],[a2,a3,a4,a5,a6,a7,a8,a9]);
autovalore=eig(Fdef*inv(V1))

% autovalore1=subs(autovalore,[d+delta1,delta2+delta4+d,alfa2+cp*cq*gamma1*sigma1+d,sigma2+gamma2*sigma2+alfa3+d,alfa4+gamma3*sigma3+sigma3+d,alfa5+gamma4*sigma4+sigma4+d,sigma5+gamma5*sigma5+alfa6+d,sigma6+gamma6*sigma6+alfa7+d,gamma7+d+d1],[a1,a2,a3,a4,a5,a6,a7,a8,a9]);
% autovalore2=subs(autovalore1,beta*alfa*cn*ck*(1-cc*ca),M);
% autovalore3=subs(autovalore2,M*a1/(a1+delta2+delta3),a10);
% autovalore4=subs(autovalore3,[alfa7/a9,a8/alfa6],[D1,D2]);
% autovalore5=subs(autovalore4,(a7*D2-sigma6)/alfa5,D3);
% autovalore6=subs(autovalore5,(a6*D3-sigma5*D2)/alfa4,D4);
% autovalore7=subs(autovalore6,(a5*D4-sigma4*D3)/alfa3,D5);
% autovalore8=subs(autovalore7,(a4*D5-sigma3*D4)/alfa2,D6);
% autovalore9=subs(autovalore8,D6+theta1*D5+theta2*D4+theta3*D3+theta4*D2+theta5,M1)