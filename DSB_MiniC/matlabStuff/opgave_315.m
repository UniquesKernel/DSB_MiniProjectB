% ***************************************************************
% opgave 3.15
% ***************************************************************

clear; close all; clc

N = 8;

%Signal med Aplitudeværdier
x = [3  -1  0.6  -0.8  -2  0  0.9];

%Udreginig af twiddle-faktoren W_8 = e^(-j*(2*pi*m*n/8);

%Udregning af all 8 W_8 faktore: 
W_8_0 = 1;
W_8_1 = exp((-j*(2*pi/N)));
W_8_2 = exp((-j*(2*2*pi/N)));
W_8_3 = exp((-j*(2*3*pi/N)));
W_8_4 = exp((-j*(2*4*pi/N)));
W_8_5 = exp((-j*(2*5*pi/N)));
W_8_6 = exp((-j*(2*6*pi/N)));
W_8_7 = exp((-j*(2*7*pi/N)));


%Nu kan vi opstille twiddle matrisen til at udregne DFT X=x'W;

W = [W_8_0 W_8_0 W_8_0 W_8_0 W_8_0 W_8_0 W_8_0; ...
     W_8_0 W_8_1 W_8_2 W_8_3 W_8_4 W_8_5 W_8_6; ...
     W_8_0 W_8_2 W_8_4 W_8_6 W_8_0 W_8_2 W_8_4; ...
     W_8_0 W_8_3 W_8_6 W_8_1 W_8_4 W_8_7 W_8_2; ...
     W_8_0 W_8_4 W_8_0 W_8_4 W_8_0 W_8_4 W_8_0; ...
     W_8_0 W_8_5 W_8_2 W_8_7 W_8_4 W_8_1 W_8_6; ...
     W_8_0 W_8_6 W_8_4 W_8_2 W_8_0 W_8_6 W_8_4];
 
X = x*W;

dft_x_fft = fft(x);

figure(3); clf
plot(abs(dft_x_fft),'.','MarkerSize',30)
hold on
plot(1:7,abs(X),'.r','MarkerSize',30)
grid on
title('Matalb fft vs manual fft')
legend('Matlab-DFT','Manual DFT')

%% Svar e)
%  De to DFT´er er IKKE ens da vi har udregnet twiddle-faktoren for 8 punter N = 8 og fft()
%  udregner for 7 unkter da det er størrelsen af x vektoren. Hvis vi laver en
%  fft af 8 punkter dvs. fft(x,8) vil de nu være identiske undtagen at det
%  sidste punkt vil mangle i X da W en 7x7 mattrix og ikke en 8x8 matrix. 