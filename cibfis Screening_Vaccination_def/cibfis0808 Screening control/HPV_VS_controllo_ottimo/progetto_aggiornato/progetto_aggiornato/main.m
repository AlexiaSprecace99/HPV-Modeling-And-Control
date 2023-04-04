%%%% MAIN HPV-MODEL SIMULATION (M-FILE AND SIMULINK) 

clear 
close all
clc

%% parameter type


global lambda d d1 alfa1 delta1 delta2 delta3 delta4 cp cq cn cc ck ca ...
       alfa beta alfa2 alfa3 alfa4 alfa5 alfa6 alfa7 sigma1 sigma2 sigma3 ...
       sigma4 sigma5 sigma6 gamma1 gamma2 gamma3 gamma4 gamma5 gamma6 gamma7 ...
       theta1 theta2 theta3 theta4 theta5

%% parameter loading/setting

model_parameters; %definisce tutti i parametri
N = 50;  % simulation time (days)

%% simulation by m-file;

disp('Time evaluation by ode45: ');
tic %inizia un timer
[time_E, XX] = ode45('model_equations',0:N,X0); %internamente produce molte più uscite
toc
% 
figure
t4 = tiledlayout(2,1);
nexttile; plot(time_E,XX(:,1));
ylabel('V')
nexttile; plot(time_E,XX(:,2));
ylabel('S')
xlabel(t4,'Time (years)');

figure
t4 = tiledlayout(2,1);
nexttile; plot(time_E,XX(:,3));
ylabel('E')
nexttile; plot(time_E,XX(:,4));
ylabel('H')
xlabel(t4,'Time (years)');

figure
t4 = tiledlayout(2,1);
nexttile; plot(time_E,XX(:,5));
ylabel('P')
nexttile; plot(time_E,XX(:,6));
ylabel('I1')
xlabel(t4,'Time (years)');

figure
t4 = tiledlayout(2,1);
nexttile; plot(time_E,XX(:,7));
ylabel('I2')
nexttile; plot(time_E,XX(:,8));
ylabel('I3')
xlabel(t4,'Time (years)');

figure
t4 = tiledlayout(2,1);
nexttile; plot(time_E,XX(:,9));
ylabel('A')
nexttile; plot(time_E,XX(:,10));
ylabel('R')
xlabel(t4,'Time (years)');          % figure
% 
% disp('Time evaluation by ode23: ');
% tic
% [time_E, XX] = ode23('fun',0:N,X0);
% toc
% 
% grafici;             % figure

%% simulation by simulink;

% X_0 = X0(1);
% Y_0 = X0(2);
% V_0 = X0(3);
% V_0 = X0(4);
% V_0 = X0(5);
% V_0 = X0(6);
% V_0 = X0(7);
% V_0 = X0(8);
% V_0 = X0(9);
% V_0 = X0(10);
% % 
% disp('Time evaluation by simulink: ')
% tic
% sim('model_simulink',N);
% toc
% 
% XX(:,1) = X;
% XX(:,2) = Y;
% XX(:,3) = V;
% 
% grafici;
       % figure