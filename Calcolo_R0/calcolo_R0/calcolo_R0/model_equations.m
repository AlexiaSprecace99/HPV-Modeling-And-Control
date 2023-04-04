%IMPLEMENTAZIONE MODELLO

function [Xdot] = model_equations(t,X)

global lambda d d1 alfa1 delta1 delta2 delta3 delta4 cp cq cn cc ck ca ...
       alfa beta alfa2 alfa3 alfa4 alfa5 alfa6 alfa7 sigma1 sigma2 sigma3 ...
       sigma4 sigma5 sigma6 gamma1 gamma2 gamma3 gamma4 gamma5 gamma6 gamma7 ...
       theta1 theta2 theta3 theta4 theta5
    
    Xdot = zeros(10,1);  % initialisation
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
   
%     if(V<0) 
%         V=0;
%     end
%      if(S<0) 
%         S=0;
%      end
%      if(E<0) 
%         E=0;
%      end
%      if(V<0) 
%         V=0;
%      end
%      if(H<0) 
%         H=0;
%      end
%      if(P<0) 
%         P=0;
%      end
%      if(I1<0) 
%         I1=0;
%      end
%      if(I2<0) 
%         I2=0;
%      end
%      if(I3<0) 
%         I3=0;
%      end
%      if(A<0) 
%         A=0;
%      end
%      if(R<0) 
%         R=0;
%     end
    N=V+S+H+E+P+I1+I2+I3+A+R; %popolazione totale
    alfa1 = (beta*alfa*cn*ck*(1-cc*ca)*(E+theta1*H+theta2*P+theta3*I1+theta4*I2+theta5*I3))/N
    %% equations
   
    Xdot(1) = delta2*S+delta4*S-(d+delta1)*V;
    Xdot(2) = lambda+delta1*V-(delta2+delta4+alfa1+d)*S;
    Xdot(3) = alfa1*S+delta3*alfa1*R+sigma2*H-(alfa2+cp*cq*gamma1*sigma1+d)*E;
    Xdot(4) = alfa2*E+sigma3*P-(sigma2+gamma2*sigma2+alfa3+d)*H;
    Xdot(5) = alfa3*H +sigma4*I1 -(alfa4+gamma3*sigma3+sigma3+d)*P;
    Xdot(6) = alfa4*P+sigma5*I2-(alfa5+gamma4*sigma4+sigma4+d)*I1;
    Xdot(7) = alfa5*I1+sigma6*I3-(sigma5+gamma5*sigma5+alfa6+d)*I2;
    Xdot(8) = alfa6*I2-(sigma6+gamma6*sigma6+alfa7+d)*I3;
    Xdot(9) = alfa7*I3-(gamma7+d+d1)*A;
    Xdot(10)= cp*cq*gamma1*sigma1*E+gamma2*sigma2*H+gamma3*sigma3*P+gamma4*sigma4*I1+gamma5*sigma5*I2+gamma6*sigma6*I3+gamma7*A-(delta3*alfa1+d)*R;