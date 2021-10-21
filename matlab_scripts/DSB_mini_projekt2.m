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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fsample_WM = 48000;
fsample_PC = 44100;

N_WM=length(WM10);
N_PC=length(pcFan10);

delta_f_WM = fsample_WM/N_WM;
delta_f_PC = fsample_PC/N_PC;

f_axis_WM = [0:delta_f_WM:fsample_WM-delta_f_WM];
f_axis_PC = [0:delta_f_PC:fsample_PC-delta_f_PC];

fftWM = fft(WM10);
fftPC = fft(pcFan10);

WM_freq_norm = 20*log10(2*abs((1/N_WM)*fftWM));
PC_freq_norm = 20*log10(2*abs((1/N_PC)*fftPC));

figure()
semilogx(f_axis_WM,WM_freq_norm)
title("Vindmølle")
xlabel("Frekvens (Hz)")
ylabel("dB")

figure()
semilogx(f_axis_PC,PC_freq_norm)
title("PC blæser")
xlabel("Frekvens (Hz)")
ylabel("dB")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%lowpass energi:

n_max=80/0.1;

E_WM_low = 2/N_WM*sum([abs(fftWM(1:n_max)).^2])
E_pc_low = 2/N_PC*sum([abs(fftPC(1:n_max)).^2])


%highpass energi
E_WM_high = 2/N_WM*sum([abs(fftWM(n_max:end)).^2])
E_pc_high = 2/N_PC*sum([abs(fftPC(n_max:end)).^2])


signal_ration_WM = E_WM_low/E_WM_high
signal_ration_pc = E_pc_low/E_pc_high