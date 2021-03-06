clear all
close all
clc

kepler_data=fitsread("kplr010001893-2011177032512_llc.fits","binarytable");

time_ = kepler_data{1};
data_ = kepler_data{4};

data=data_(~isnan(data_));
time=time_(~isnan(data_));

data_N=length(data);

delta_t=(time(end)-time(1))/length(time);

f_sample=1/delta_t;

delta_f=f_sample/data_N;
figure(1)
plot(time,data);
xlabel("Tid (dage) efter 1-1-2009");
ylabel("Photometrisk flux (e^-/s)")

WindowsLength = 128;

figure(2)
spectrogram(data,blackman(WindowsLength), WindowsLength-12, WindowsLength, f_sample ,'yaxis');

view(-45,65)

n = 2;
fc = 5;
fs = f_sample;
[b,a] = butter(n,fc/(fs/2));
h = filter(b,a,[1 zeros(1,500)]);

% tidsdom�nefiltrering
y_med_conv = conv(data,h);

figure(2)
plot(y_med_conv)
hold on



% frekvensdom�nefiltrering
N = length(data) + length(h)-1;
X = fft(data, N);
H = fft(h, N);
Y = X.*H';
y_med_DFT = ifft(Y);

plot(y_med_DFT,'r')
xlabel("Tid (dage) efter 1-1-2009");
ylabel("Photometrisk flux (e^-/s)")
title('Time domain for convolution and frequency domain multiplication')


