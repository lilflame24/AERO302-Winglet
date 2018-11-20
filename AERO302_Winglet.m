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
span = .1875 ;  %m, span of wing
chord = .155575 ; %m, chord length of wing
A = span*chord ;   %wing area
c_l_NW = (2.*lift_NW)./((rho*(v^2)*A)) ;   %coefficient of lift 

figure(1)
plot(alpha,c_l_NW) 
xlabel('alpha (degrees)')
ylabel('Coefficient Lift')
title('C_l versus Angle of Attack -- Without Winglet')

%Drag - No Winglet
load('WOff.mat')
NW_AOA_0 = WOff{1} ;
fy_NW_AOA_0 = NW_AOA_0(:,2) ;
NW_AOA_4 = WOff{2} ;
fy_NW_AOA_4 = NW_AOA_4(:,2) ;
NW_AOA_8 = WOff{3} ;
fy_NW_AOA_8 = NW_AOA_8(:,2) ;
NW_AOA_9 = WOff{4} ;
fy_NW_AOA_9 = NW_AOA_9(:,2) ;
NW_AOA_10 = WOff{5} ;
fy_NW_AOA_10 = NW_AOA_10(:,2) ;
NW_AOA_11 = WOff{6} ;
fy_NW_AOA_11 = NW_AOA_11(:,2) ;
NW_AOA_12 = WOff{7} ;
fy_NW_AOA_12 = NW_AOA_12(:,2) ;
NW_AOA_13 = WOff{8} ;
fy_NW_AOA_13 = NW_AOA_13(:,2) ;
NW_AOA_14 = WOff{9} ;
fy_NW_AOA_14 = NW_AOA_14(:,2) ;

for ii = 1:9
    R(ii) = ((6.4136e-9)*alpha(ii)^7) - ((2.4054e-7)*alpha(ii)^6) + ((6.3238e-7)*alpha(ii)^5) + ((6.7126e-5)*alpha(ii)^4)- ((8.0391e-4)*alpha(ii)^3) + ((.0023*alpha(ii)^2)) + ((.0021*alpha(ii))) + .0453 ;
    drag_nosting = [mean(fy_NW_AOA_0) mean(fy_NW_AOA_4) mean(fy_NW_AOA_8) mean(fy_NW_AOA_9) mean(fy_NW_AOA_10) mean(fy_NW_AOA_11) mean(fy_NW_AOA_12) mean(fy_NW_AOA_13) mean(fy_NW_AOA_14)] ;
    drag_sting = drag_nosting - 1.22 ; %drag force accounting for sting
    drag_NW(ii) = R(ii) * drag_sting(ii) ;
end 
c_d_nosting = (2.*drag_nosting)./((rho*(v^2)*A)) ;   %uncorrected coefficient of drag
c_d_NW = (2.*drag_NW)./((rho*(v^2)*A)) ;    %coefficient of drag

figure(2)
subplot(1,2,1)
plot(alpha,c_d_NW)
xlabel('alpha (degrees)')
ylabel('coefficient of drag')
title('C_d v Angle of Attack -corrected- No Winglet')
subplot(1,2,2)
plot(alpha,c_d_nosting)
xlabel('alpha (degrees)')
ylabel('coefficient of drag')
title('C_d v Angle of Attack -raw- No Winglet')

ratio_NW = lift_NW./drag_nosting ;
ratio_NW_corrected = lift_NW./drag_NW ;    %L/D efficiency ratio
figure(3)
subplot(1,2,1)
plot(alpha,ratio_NW_corrected) 
xlabel('alpha (degrees)')
ylabel('L/D efficiency ratio')
title('L/D v Angle of Attack -corrected- No Winglet')
axis([0 15 25 50])
subplot(1,2,2)
plot(alpha,ratio_NW)
xlabel('alpha (degrees)')
ylabel('L/D efficiency ratio')
title('L/D v Angle of Attack -raw- No Winglet')
axis([0 15 0 2])







