function Sig = Sigmoid(par,t)

global L1 k1 t1 L2 k2 t2

L1 = par(1);
k1 = par(2);
t1 = par(3);
% L2 = par(4);
% k2 = par(5);
% t2 = par(6);

Sig = 1- (L1./(1+exp(-k1.*(t-t1))));
%sig2 = L2./(1+exp(-k2.*(t'-t2)));

%Utime = L1./(1+exp(-k1.*(t'-t1))) - L2./(1+exp(-k2.*(t'-t2)));
