%% AERO302 Winglet Code
    %import data from excel to workspace, there are differing sample sizes
    %so to stay consistent lets use 1:75 
clear all; close all; clc; 

%Fz readings are lift
%Fy readings are drag 
% alpha = [0 4 8 9 10 11 12 13 14] ;  %measured angles of attack
alpha = [0 4 8 9 10 11 12 13 14] ;    %seventy five points between 0 and 14 degrees
v = 15 ;    %m/s, velocity for test
fz_off = load('z_off.txt') ;
fz_NW_AOA_0 = load('Fz_0.txt') ;
fz_NW_AOA_4 = load('Fz_4.txt') ;
fz_NW_AOA_8 = load('Fz_8.txt') ;
fz_NW_AOA_9 = load('Fz_9.txt') ;
fz_NW_AOA_10 = load('Fz_10.txt') ;
fz_NW_AOA_11 = load('Fz_11.txt') ;
fz_NW_AOA_12 = load('Fz_12.txt') ;
fz_NW_AOA_13 = load('Fz_13.txt') ;
fz_NW_AOA_14 = load('Fz_14.txt') ;

lift_NW = [mean(fz_NW_AOA_0) mean(fz_NW_AOA_4) mean(fz_NW_AOA_8) mean(fz_NW_AOA_9) mean(fz_NW_AOA_10) mean(fz_NW_AOA_11) mean(fz_NW_AOA_12) mean(fz_NW_AOA_13) mean(fz_NW_AOA_14)] ;

%Lift - No Winglet
rho = 1.225 ;   %standard atmospheric density
S = .155575 ;   %wing area
c_l = (2.*lift_NW)./((rho*(v^2)*S)) ;   %coefficient of lift 

figure(1)
plot(alpha,c_l) 
xlabel('alpha (degrees)')
ylabel('Coefficient Lift')
title('C_l versus Angle of Attack')



