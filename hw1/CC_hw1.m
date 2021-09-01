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
t = 0:0.000001:0.003;

% All from given equation
steadyState = 15*sin(40000*t);
transient = -25*exp(-32000*t).*sin(24000*t);
total = steadyState + transient;

figure()
hold on
plot(t, steadyState)
plot(t, transient)
plot(t,total)
legend("Steady State", "Transient", "Total")
xlabel("Time (s)")
ylabel("Current (mA)")
hold off

% MATLAB Frequency-Domain Plot
R = 1;
C = 1/(30*pi);
a = 1/(R*C);

% w = 2pif
w = 2*pi*logspace(-1,4);

% Calculate magnitude and angle to plot
transferMag = (a^2) ./ (a^2 + w.^2);
phaseResponse = angle((a^2) ./ ((a + 1j.*w).^2));

figure()
hold on
subplot(2, 1, 1, 'XScale', 'log');
loglog(w, transferMag);
legend("Magnitude response");
subplot(2, 1, 2, 'XScale', 'log');
semilogx(w, phaseResponse);
legend("Phase response");
hold off
