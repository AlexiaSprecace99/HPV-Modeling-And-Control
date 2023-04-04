clear 
close all
clc

global lambda d d1 alfa1 delta1 delta2 delta3 delta4 cp cq cn cc ck ca ...
       alfa beta alfa2 alfa3 alfa4 alfa5 alfa6 alfa7 sigma1 sigma2 sigma3 ...
       sigma4 sigma5 sigma6 gamma1 gamma2 gamma3 gamma4 gamma5 gamma6 gamma7 ...
       theta1 theta2 theta3 theta4 theta5 Lvect C1 C2 C3 C4 C5 C6 B1 B2 N X0 Lvect1

model_parameters; %definisce tutti i parametri
N = 50;  % simulation time (years)
time = 0:1:N-1;
tic
[~,Xnolk] = ode45('model_equations',time,X0);
toc

model_parameters_opt;
% %% Optimal control
% %U01 = 0.87.*ones(N,1).*(1-time'./N); %sequenza tentativo
% %U01 = 1.*ones(N,1); %sequenza tentativo
% U02 = 1.*ones(N,1).*(1-time'./N); %sequenza tentativo
% %U0 = [U01 U02]';
% 
% %lb1 = zeros(N,1); % lower bounds
% lb2 = zeros(N,1); % lower bounds
% %lb = [lb1 lb2]';
% 
% %ub1 = 1.*ones(N,1); % upper bounds
% ub2 = 2.*ones(N,1); % upper bounds
% %ub = [ub1 ub2]';

U01 = [0.6 1 30]'; 
lb1 = [0 0 0]'; 
ub1 = [1 1 N-1]';

U02 = [1 1.5 20 1 1 40]'; 
lb2 = [0 0 0 0 0 0]'; 
ub2 = [2 2 100 1 1 100]';

U0 = [U01;U02];
lb = [lb1;lb2];
ub = [ub1;ub2];
options = optimoptions('fmincon','Display','iter-detailed','Algorithm','active-set','FunValCheck','on');
tic
[Uvec,fval,exitflag] = fmincon('cost_function',U0,[],[],[],[],lb,ub,'nonlincon',options);
toc
Lvect = Sigmoid(Uvec(1:3,1),time)';
Lvect1 = Screening(Uvec(4:9,1),time);
[time, XFin] = ode45('model_equations_opt',time,X0);

%plots
figure
t4 = tiledlayout(2,1);
nexttile; plot(time,Xnolk(:,1)); hold on; plot(time,XFin(:,1),'r');
ylabel('V')
nexttile; plot(time,Xnolk(:,2)); hold on; plot(time,XFin(:,2),'r');
ylabel('S')
title(t4,'Optimal Vaccination and Screening'); xlabel(t4,'Time (years)');
legend({'No control' 'Vaccination and screening control'},'orientation','horizontal','location','northoutside');

figure
t5 = tiledlayout(2,1);
nexttile; plot(time,Xnolk(:,3)); hold on; plot(time,XFin(:,3),'r');
ylabel('E')
nexttile; plot(time,Xnolk(:,4));  hold on; plot(time,XFin(:,4),'r');
ylabel('H')
title(t5,'Optimal Vaccination and Screening'); xlabel(t5,'Time (years)');
legend({'No control' 'Vaccination and Screening control'},'orientation','horizontal','location','northoutside');

figure
t6 = tiledlayout(2,1);
nexttile; plot(time,Xnolk(:,5)); hold on; plot(time,XFin(:,5),'r');
ylabel('P')
nexttile; plot(time,Xnolk(:,6));  hold on; plot(time,XFin(:,6),'r');
ylabel('I1')
title(t6,'Optimal Vaccination and Screening'); xlabel(t6,'Time (years)');
legend({'No control' 'Vaccination and Screening control'},'orientation','horizontal','location','northoutside');

figure
t7 = tiledlayout(2,1);
nexttile; plot(time,Xnolk(:,7)); hold on; plot(time,XFin(:,7),'r');
ylabel('I2')
nexttile; plot(time,Xnolk(:,8));  hold on; plot(time,XFin(:,8),'r');
ylabel('I3')
title(t7,'Optimal Vaccination and Screening'); xlabel(t7,'Time (years)');
legend({'No control' 'Vaccination and Screening control'},'orientation','horizontal','location','northoutside');

figure
t8 = tiledlayout(2,1);
nexttile; plot(time,Xnolk(:,9)); hold on; plot(time,XFin(:,9),'r');
ylabel('A')
nexttile; plot(time,Xnolk(:,10));  hold on; plot(time,XFin(:,10),'r');
ylabel('R')
title(t8,'Optimal Vaccination and Screening'); xlabel(t8,'Time (years)');
legend({'No control' 'Vaccination and Screening control '},'orientation','horizontal','location','northoutside');
figure
plot(time,Lvect,'r');
xlabel('Time (years)');
ylabel('Vaccination');
title('Optimal Vaccination');
figure
plot(time,Lvect1,'g'); 
xlabel('Time (years)'); 
ylabel('Screening');
title('Optimal Screening');

