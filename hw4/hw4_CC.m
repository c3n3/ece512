%---------------------------------------------------------------------
% File: hw4_CC.m
% Description: Plots outputs via convolution, and relevant graphs.
% Author: Caden Churchman, ccaden21@ksu.edu,
% (c)2021, Caden Churchman. All rights reserved.
% Date: 10 October 2021(Version 1.00)
% Platform: MATLAB Release R2021a, Ubuntu 20.04
% Reference: Steve Warren. ECE 512 Homework Assignment #4, (c)2021,
% Kansas State University
%---------------------------------------------------------------------

function hw4_CC(inputFile, filtType, fc)
    res = fopen(inputFile);
    
    C = textscan(res, "%f %f", 'Delimiter', '\n');
    times = C(1,1);
    times = times{1};
    x = C(1,2);
    x = x{1};
    dTau = times(2) - times(1);
    RC = 1 / (2 * pi * fc);
    hfun = 0;
    delta = 0;
    if (filtType == 0)
    % HLP
        hfun = @(t) (1 / (RC^2)) * t .* exp(-t / RC);
        
    else
    %HHP
        hfun = @(t) ((-2 / (RC)) + (1 / (RC^2)) * t) .* exp(-t / RC);
        delta = (1/dTau);
    end
    h = hfun(0:dTau:20*RC);
    h(1) = delta + h(1);
    y = physConv_CC(x,h,dTau);
    figure()
    grid on
    hold on
    t = 0:dTau:(length(x) - 1)*dTau;
    subplot(3, 1, 1);
    grid on
    plot(t, x);
    
    name = sprintf("%s, %d Samples, Δτ = %f", inputFile, length(x), dTau);
    title(name);
    xlabel("Time (s)");
    ylabel("Voltage (V)");
    legend("X(t)");

    % Plot phase shift
    t = 0:dTau:(length(h) - 1)*dTau;
    subplot(3, 1, 2);
    grid on
    plot(t, h);
    type = "High-pass";
    if (filtType == 0)
       type = "Low-pass";
    end
    name = sprintf("h(t) of a %s filter, fc = %f", type, fc);
    title(name);
    xlabel("Time (s)");
    ylabel("h(t)")
    legend("impulse response");
    
    t = 0:dTau:(length(y) - 1)*dTau;
    subplot(3, 1, 3);
    grid on
    plot(t, y');
    title("Y(t) Output")
    xlabel("Time (s)");
    ylabel("Voltage (V)");
    legend("Y(t)");
    fileName = sprintf("%s-fc%d-%s.PNG", inputFile, fc, type);
    print(fileName, "-dpng");
end

