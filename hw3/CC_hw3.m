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

t = -8:0.001:8;

u = @(t) t > 0; 

f = @(t) (3 - exp(-2*t)) .* (u(t + 1) - u(t - 4));

fe = @(t) (f(t) + f(-t)) / 2;
fo = @(t) (f(t) - f(-t)) / 2;

hold on
grid on
plot(t, fo(t));
plot(t, fe(t));
plot(t, f(t));

legend("fo(t)", "fe(t)", "f(t)");
hold off