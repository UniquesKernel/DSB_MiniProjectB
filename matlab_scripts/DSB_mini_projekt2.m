clear all
close all
clc

[pcFan,sf1] = audioread("Audio/pcFan44100.wav");

pcFan10 = [pcFan(1:441000)];

pcxaxis = linspace(0,10,441000);


[WM,sf2] = audioread("Audio/Wind_turbine_48k.wav");

WM10 = [WM(1:(480000))];
WMxaxis = linspace(0,10,480000);

figure()
plot(pcxaxis,pcFan10)
title("PC blæser")
xlabel("Sekunder")
ylabel("Lydstyrke")

figure()
plot(WMxaxis,WM10)
title("Vindmølle")
xlabel("Sekunder")
ylabel("Lydstyrke")

figure()
fsample = 44100;
N=length(pcFan)

delta_f = fsample/N;

f_axis = [0:delta_f:fsample-delta_f];

fftPCFan = fft(pcFan);

pcFan_freq_norm = 20*log10(2*abs((1/N)*fftPCFan));

semilogx(f_axis,pcFan_freq_norm)
