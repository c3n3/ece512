%---------------------------------------------------------------------
% File: CC_hw2.m
% Description: This script plots various circuit functions.
% Author: Caden Churchman, ccaden21@ksu.edu,
% (c)2021, Caden Churchman. All rights reserved.
% Date: 10 September 2021(Version 1.00)
% Platform: MATLAB Release R2021a, Ubuntu 20.04
% Reference: Steve Warren. ECE 512 Homework Assignment #2, (c)2021,
% Kansas State University
%---------------------------------------------------------------------

% Find the roots of unity for
N = 12;
n = 0:N;

% Calculate roots
roots = exp(2*n*pi*1j / N);

% Spiro graph
x = -1:0.001:1000;
a = @ (R, r, p, t) (R + r) * cos(t) + p * cos((R + r) * t / r);
b = @ (R, r, p, t) (R + r) * sin(t) + p * sin((R + r) * t / r);

% Spiro settings
R = 3;
r = 100;
p = 115;

% Find max to reduce to unit circle
m = max(a(R,r,p,x));

%% Plottings 
figure()
hold on
grid on

% Roots
h(1) = plot(real(roots), imag(roots), '+', 'color', 'r');

% Unit circle
h(2) = plot(cos(0:0.01:2*pi), sin(0:0.01:2*pi), '--', 'color', 'b');

% Spiro
plot(a(R,r,p,x) / m, b(R,r,p,x) / m)

% Configure
title("Roots of unity with a spiro graph");
legend("Unity roots", "Unit circle", "Spiro graph");
uistack(h(1), 'top');
pause(0.5);
uistack(h(2), 'top');
axis equal
print("out", "-dpng");
hold off