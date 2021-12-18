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

f_sample=1/delta_t

delta_f=f_sample/data_N;
figure(1)
plot(time,data);
xlabel("Tid (dage) efter 1-1-2009");
ylabel("Photometrisk flux (e^-/s)")



