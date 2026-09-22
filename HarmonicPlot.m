% This code will take a basic harmonic oscillator and represent its
% functions of position, velocity, and acceleration. The plot will depict
% all of them separately

clear; clc; close all

omega = input("Give a value in rad/s for angular velocity: "); % User input value for angular velo
x0 = input("Give a value for the initial mass position (m): "); % User input for initial position
v0 = input("Give a value for the initial velocity (m/s): "); % User input for initial velocity

t = linspace(-6*pi / omega, 6*pi / omega , 2000);

phi = atan2((x0*omega), v0);

A0 = [x0 v0/omega];
A = norm(A0); % Compute magnitude of displacement for representation via one function

x = A*sin((omega*t)+phi); % Calculate position
v = A * omega * cos((omega*t) + phi); % Calculate velocity
a = -A * omega^2 * sin((omega*t) + phi); % Calculate acceleration

figure;
plot(t,x,'r-','LineWidth',1.5);
title('1 DOF Free Vibration Undamped Position')
xlabel('Time (sec)')
ylabel('Position (m)')
grid on;

figure;
plot(t,v,'b-','LineWidth',1.5);
title('1 DOF Free Vibration Undamped Velocity')
xlabel('Time (sec)')
ylabel('Velocity (m/s)')
grid on;

figure;
plot(t,a,'g-','LineWidth',1.5);
title('1 DOF Free Vibration Undamped Acceleration')
xlabel('Time (sec)')
ylabel('Acceleration (m/s^2)')
grid on;
