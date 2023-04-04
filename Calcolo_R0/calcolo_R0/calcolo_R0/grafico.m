ll = 3;
time = 0:N;

figure;
% plot(time,XX(:,1),'k','LineWidth',ll),xlabel('TIME [days]'),xlim([time(1) time(end)]),grid on; %vaccinati in nero
% hold on
plot(time,XX(:,1),'r','LineWidth',ll),title('V(nero) e S(rosso)'),xlabel('TIME [days]'); %suscettibili rosso
% plot(time,XX(:,3),'k','LineWidth',ll),xlabel('TIME [days]'),xlim([time(1) time(end)]),grid on; %esposti senza sintomi
%in nero (E)
hold on
%plot(time,XX(:,9),'r','LineWidth',ll),title('E(nero) e H(rosso)'),xlabel('TIME [days]'); %esposti con sintomi rosso (H)
% semilogy(time,XX(:,3),'k','LineWidth',ll),title('CANCER'),xlabel('TIME [days]'),xlim([time(1) time(end)]),grid on;
% ylabel('[copies/ml]')