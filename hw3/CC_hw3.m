%---------------------------------------------------------------------
% File: CC_hw3.m
% Description: This script plots various circuit functions.
% Author: Caden Churchman, ccaden21@ksu.edu,
% (c)2021, Caden Churchman. All rights reserved.
% Date: 10 September 2021(Version 1.00)
% Platform: MATLAB Release R2021a, Ubuntu 20.04
% Reference: Steve Warren. ECE 512 Homework Assignment #3, (c)2021,
% Kansas State University
%---------------------------------------------------------------------

t = 0:0.001:3;

u = @(t) t > 0; 

series = @(t) (-0.2 * exp(-5 * t) .* cos(5*t + pi / 2));

parallel = @(t) (-0.5 * exp(-2 * t) - t .* exp(-2*t));


% Serial plot
subplot(2, 1, 1);
grid on
plot(t, series(t));

title("Series R = 20\Omega, L = 2H, C = 10mF")
legend("Il(t)")
ylabel("Amps")
xlabel("Time (s)")


% Parallel plot
t = 0:0.001:5;

subplot(2, 1, 2);
grid on
plot(t, parallel(t));

title("Parallel R = 0.5\Omega, L = 0.5H, C = 0.5F")
legend("Il(t)")
ylabel("Amps")
xlabel("Time (s)")

print("out.png", "-dpng");