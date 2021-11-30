clear all
close all
clc

kepler_data=fitsread("kplr010001893-2011177032512_llc.fits","binarytable");

time_ = kepler_data{1};
data_ = kepler_data{4};

data=data_(~isnan(data_));
time=time_(~isnan(data_));

data_N=length(data);

delta_t=(time(end)-time(1))/length(time)

f_sample=1/delta_t;

delta_f=f_sample/data_N;
figure(1)
plot(time,data);
xlabel("Tid (dage) efter 1-1-2009");
ylabel("Photometrisk flux (e^-/s)")


data_spec=fft(data);

data_freq_norm = 20*log10(2*abs((1/data_N)*data_spec));
f_axis = [0:delta_f:f_sample-delta_f];

figure(2)

semilogx(f_axis,data_freq_norm)
xlabel("Frekvens (1/dag)");
ylabel("Intensitet")
axis([0.11 100 -80 40])
hold on
smooth_spec = raw_smooth(data_spec(2:end)',35);
smooth_data_freq_norm = 20*log10(2*abs((1/data_N)*smooth_spec));

semilogx(f_axis(2:end),smooth_data_freq_norm,'r')
% xlabel("Frekvens (1/dag)");
% ylabel("Intensitet")
% axis([0.11 100 -80 40])
