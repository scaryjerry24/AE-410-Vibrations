% This will observe the effects of Coulomb damping on a slope with a simple
% mass block system. There are two springs attached in parallel (k_eq = 2k)
k = 1000; % N/m
m = 20; % kg
u = 0.1; % friction coefficient (unitless)
g = 9.81; % m/s^2
theta = pi/6; % rad
omega_n = sqrt(2*k/m); % system natural frequency
initialDisplacement = 0.1; % m
initialVelocity = 5; % m/s

% constants solved with initial conditions from general two function
% homogeneous format (first half-cycle, moving down the slope)
A = initialDisplacement - ((m*g)/(2*k))*(sin(theta)-(u*cos(theta)));
B = initialVelocity/omega_n;
D = ((m*g)/(2*k))*(sin(theta)-(u*cos(theta)));
c = [A B]; % vector representation of specific constants
C = norm(c);
phi = atan2(B,A); % phase angle for cos(omega_n t - phi) format

% first half-cycle ends when velocity = 0, i.e. omega_n*t - phi = 0
t1 = phi/omega_n; % time of first turnaround
t = linspace(0,t1,1000); % time vector for first half-cycle
x = C*cos((omega_n*t)-phi) + D; % response of system for first half cycle

figure;
plot(t,x,'k--','LineWidth',1.5);
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Coulomb-Damped Mass Block Response for first half cycle');
grid on;

% ---- Full response until motion stops ----
halfcycle = pi/omega_n; % every later half-cycle is a full half-period
cg = m*g*sin(theta)/(2*k); % gravity center
Delta = u*m*g*cos(theta)/(2*k); % friction offset

T = t; X = x; % store first half-cycle
x_turn = X(end); t_turn = t1; r = 1; % r counts half-cycles

% each new half-cycle starts from rest at the last turnaround
while abs(x_turn - cg) > Delta % keep going until friction holds it
    if x_turn > cg
        off = cg + Delta; % moving up the slope, friction points down
    else
        off = cg - Delta; % moving down the slope, friction points up
    end
    tau = linspace(0,halfcycle,200);
    xs = off + (x_turn - off)*cos(omega_n*tau);
    T = [T, t_turn + tau(2:end)];
    X = [X, xs(2:end)];
    x_turn = xs(end);
    t_turn = t_turn + halfcycle;
    r = r + 1;
end

fprintf('Half-cycles: %d, x_final = %.4f m, t_stop = %.3f s\n', r, x_turn, t_turn);

figure;
plot(T,X,'k','LineWidth',1.2);
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Coulomb-Damped Mass Block Response on Slope');
grid on;