% Plot of a 1 DOF critically damped with given initial conditions. The goal
% is to show the typical critically damped response of the system. Super
% simple due to the constants of the system being pre-determined with the
% given problem initial conditions.

clear; clc;

t = linspace(0,0.3,1000); % time vector definition
x = (0.03 - 8.225*t).*exp(-59.16*t); % position response

figure;
plot(t,x,'k--','LineWidth',1.5);
grid on;
xlabel('Time (s)');
ylabel('Displacement');
title('Critically Damped 1-DOF Response');