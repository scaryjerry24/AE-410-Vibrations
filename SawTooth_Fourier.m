% This script will be developed to model the behavior of the
% periodic sawtooth function. I will try and label and make it
% interactive within the command window for whoever is running.


clear; clc; close all;

%% Plot of the Saw Tooth using mod() function

tau = input("Give a value of the period: ");
A   = input("Give a value for the saw-tooth amplitude: ");

t = linspace(0, tau, 2000);   % time vector, spans 1 period
x = A * mod(t, tau) / tau;      % sawtooth: ramps 0->A each period ( doing more periods), then resets

figure;
plot(t, x, 'b-', 'LineWidth', 2.0);
xlabel('t');
ylabel('x(t)');
title('Sawtooth Wave x(t) (user input period and amplitude');
grid on;

%% Fourier expansion plot from n=1 increments of 1 to n=5 over one period

Omega = pi;
x1 = A/2*ones(size(t)); 
x2 = x1 - (A/(pi))*sin(Omega*t);
x3 = x2 - (A/(2*pi))*sin(2*Omega*t);
x4 = x3 - (A/(3*pi))*sin(3*Omega*t);
x5 = x4 - (A/(4*pi))*sin(4*Omega*t);
x6 = x5 - (A/(5*pi))*sin(5*Omega*t);


% Plot the Fourier series approximation
hold on; % Align with previous plot of sawtooth
plot(t,x1, 'k--', 'linewidth', 1.5);
plot(t,x2, 'b--', 'linewidth', 1.5);
plot(t,x4, 'o--', 'linewidth', 1.5);
plot(t, x6, 'r--', 'LineWidth', 1.5);
hold off; % Release the plot

% Now independent
figure;
plot(t,x1, 'r--', 'linewidth', 1.5); % 1.7 part a
title('1.7 Part A Fourier Series Approximation (n=0)');
figure;
plot(t,x2, 'r--', 'linewidth', 1.5); % 1.7 part b
title('1.7 Part B Fourier Series Approximation (n=1)');
figure;
plot(t,x4, 'r--', 'linewidth', 1.5); % 1.7 part c
title('1.7 Part C Fourier Series Approximation (n=3)');
figure;
plot(t, x6, 'r--', 'LineWidth', 1.5); % 1.7 part d
title('1.7 Part D Fourier Series Approximation (n=5)');
