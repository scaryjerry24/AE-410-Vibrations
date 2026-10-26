% this code is created to analyze an underdamped continuous step response
% vibratory system. The response has been generated previously via by parts
% integration over convolution between F(tau) * h(t-tau)

close all; clear; clc;

m = 20; % kg
k = 4500; % N/m
c = 300;   % N*s/m
F0 = 1; % N

naturalFrequency = sqrt(k / m);
period = (2*pi)/naturalFrequency;
dampingRatio = c / (2 * sqrt(m * k));
dampedFrequency = naturalFrequency * sqrt(1 - dampingRatio^2);
decayRate = dampingRatio * naturalFrequency;

t = linspace(0,3*period,1000); % seconds for time vector

x = (F0/k) * (1 - exp(-decayRate*t) .* ...
    (cos(dampedFrequency*t) + ...
    (dampingRatio/sqrt(1 - dampingRatio^2)) .* sin(dampedFrequency*t)));

figure;
plot(t, x, 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('x(t) m');
title('Underdamped Continuous Step Response');
legend('Displacement response', 'Location', 'best');