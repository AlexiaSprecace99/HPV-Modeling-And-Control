%%calcolo del punto di equilibrio
clear 
close all
clc

global lambda d d1 alfa1 delta1 delta2 delta3 delta4 cp cq ...
        alfa2 alfa3 alfa4 alfa5 alfa6 alfa7 sigma1 sigma2 sigma3 ...
       sigma4 sigma5 sigma6 gamma1 gamma2 gamma3 gamma4 gamma5 gamma6 gamma7 ...


syms V S E H P I1 I2 I3 A R
syms d d1 alfa1 delta1 delta2 delta4 delta3 cp cq cn ck cc ca alfa beta alfa2 alfa3 lambda sigma1
syms alfa4 alfa5 alfa6 alfa7 sigma2 sigma3 sigma4 sigma5 sigma6 gamma1 gamma2 gamma3 gamma4 gamma5 gamma6 gamma7
    
eqn1 = delta2*S+delta4*S-(d+delta1)*V ==0;
eqn2 = lambda+delta1*V-(delta2+delta4+d)*S ==0;
eqns = [eqn1 eqn2];
vars = [V S];
[equilibrium] = solve(eqns,vars,'ReturnConditions', true);
