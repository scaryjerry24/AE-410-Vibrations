% this script is simply to model a more control systems approach to
% modeling a vibratory system. There are to be two impulses in contact with
% the system. One at t = 0s, and one at t = 0.2s.

close all; clear; clc;

m = 5; k = 2000; c = 10;
F1 = 20; F2 = 10; tau = 0.2;

wn = sqrt(k/m);
zeta = c/(2*sqrt(k*m));
wd = wn*sqrt(1 - zeta^2);

t = linspace(0, 5, 5000);

x1 = F1/(m*wd) * exp(-zeta*wn*t) .* sin(wd*t);
x2 = F2/(m*wd) * exp(-zeta*wn*(t-tau)) .* sin(wd*(t-tau)) .* (t >= tau);
x  = x1 + x2;

figure;
subplot(3,1,1)
plot(t, x1,'r', 'LineWidth', 1.2); grid on
xlabel('Time (s)'); ylabel('x1(t) (m)');
title('First impulse response');

subplot(3,1,2)
plot(t, x2,'b', 'LineWidth', 1.2); grid on
xlabel('Time (s)'); ylabel('x2(t) (m)');
title('Second impulse response');

subplot(3,1,3)
plot(t, x,'--', 'LineWidth', 1.2); grid on
xlabel('Time (s)'); ylabel('x(t) (m)'); 
title('Combined superposition impulse response');

