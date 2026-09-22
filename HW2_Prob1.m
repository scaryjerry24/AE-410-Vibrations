% This code will model the pre-determined system displacement response of the spring,
% damper, mass system for problem 1 of hw 2 in AE 410

e = 2.718;
t = linspace(0,0.084516,2000);
x = exp(-59.16*t).*(0.03 - 8.2252*t);

figure;
plot(t, x, 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Displacement (m)');
title('System Displacement Response');
grid on;