%---------------------------------------------------------------------
% File: CC_hw1.m
% Description: This script plots various circuit functions.
% Author: Caden Churchman, ccaden21@ksu.edu,
% (c)2021, Caden Churchman. All rights reserved.
% Date: 31 August 2021(Version 1.00)
% Platform: MATLAB Release R2021a, Ubuntu 20.04
% Reference: Steve Warren. ECE 512 Homework Assignment #1, (c)2021,
% Kansas State University
%---------------------------------------------------------------------

% Times we will plot
t = 0:0.000001:0.0003;

% All from given equation
steadyState = 15*sin(40000*t);
transient = -25*exp(-32000*t).*sin(24000*t);
total = steadyState + transient;

figure()
hold on
grid on
title("Response graphs")
plot(t, steadyState, '.')
plot(t, transient, '-')
plot(t,total)
legend("Steady State", "Transient", "Total")
xlabel("Time (s)")
ylabel("Current (mA)")
hold off
print("1", "-dpng");

% MATLAB Frequency-Domain Plot
R = 1;
C = 1/(30*pi);
a = 1/(R*C);

% w = 2pif
f = logspace(-1,4, 1000);
w = 2*pi*f;

% Calculate magnitude and angle to plot
transferMag = 20*log10((a^2) ./ (a^2 + w.^2));
phaseResponse = -atan2(2*a*w, a.^2 - w.^2);

% Plot magnitude in db
figure()
hold on
grid on
subplot(2, 1, 1, 'XScale', 'log');
semilogx(f, transferMag);
title("Magnitude response")
xlabel("Hz");
ylabel("Db");
legend("Magnitude response");

% Plot phase shift
subplot(2, 1, 2, 'XScale', 'log');
semilogx(f, phaseResponse);
title("Phase response")
xlabel("Hz");
ylabel("Rad")
legend("Phase response");
hold off

print("2", "-dpng");
