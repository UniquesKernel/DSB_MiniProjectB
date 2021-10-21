[pcFan,sf1] = audioread("WTF_Wind turbine 3 (ID 1321)_BSB.wav");

fsample = 44100;
N=length(pcFan)

delta_f = fsample/N;

f_axis = [0:delta_f:fsample-delta_f];

fftPCFan = fft(pcFan);

pcFan_freq_norm = 20*log10(2*abs((1/N)*fftPCFan));

semilogx(f_axis,pcFan_freq_norm)
