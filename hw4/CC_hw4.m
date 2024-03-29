%---------------------------------------------------------------------
% File: CC_hw4.m
% Description: This script plots various circuit functions.
% Author: Caden Churchman, ccaden21@ksu.edu,
% (c)2021, Caden Churchman. All rights reserved.
% Date: 10 September 2021(Version 1.00)
% Platform: MATLAB Release R2021a, Ubuntu 20.04
% Reference: Steve Warren. ECE 512 Homework Assignment #4, (c)2021,
% Kansas State University
%---------------------------------------------------------------------


% We do convolutions
%x = [2,3,1,-1,-1];
%h = [2,1,-0.5,0.25];
%dTau = 0.4;
%y = physConv_CC(x,h,dTau);
%t = 0:dTau:(length(y) - 1)*dTau;
%figure()
%grid on
%plot(t,y')
% 
hw4_CC("square-400ms.txt", 1, 20);
hw4_CC("square-400ms.txt", 0, 20);
hw4_CC("ecg.txt", 0, 10);
hw4_CC("SpO2.txt", 1, 1);
