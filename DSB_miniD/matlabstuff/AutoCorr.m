% Clear screen
clear all
close all
clc

% Load keplar data
kepler_data=fitsread("kplr010001893-2011177032512_llc.fits","binarytable");

time_ = kepler_data{1};
data_ = kepler_data{4};

% Remove NaN data
data=data_(~isnan(data_));
time=time_(~isnan(data_));

data_N = length(data);
delta_t = (time(end)-time(1))/length(time);

f_sample=1/delta_t;
f_cutoff = 10;
M = 500;

freq_resolution = f_sample / M
freq_bin = f_cutoff / freq_resolution;
freq_bin_round = round(freq_bin)

figure(1)
plot(time,data);
xlabel("Tid (dage) efter 1-1-2009");
ylabel("Photometrisk flux (e^-/s)")

new_data=movmean(data,50);




figure(2)
hold on
subplot(2,1,1)
plot(time,new_data)
title('Moving mean of data')
xlabel('number of days after 01-01-2019');
ylabel('Photometric flux')

FlatData = data-new_data;

subplot(2,1,2); 
plot(time,FlatData);
title('Flattend data')
xlabel('number of days after 01-01-2019');
ylabel('Photometrix flux')


[corrData,lags]=xcorr(FlatData,'coeff');

figure(3)
plot(lags, corrData);
xlabel("lag");
ylabel("Correlation")
axis([-5000 5000 -0.2 0.2])




figure(4)
hold on
plot(mod(time+0.2,0.1),FlatData,'.');
title('Flattend data')
xlabel('number of days after 01-01-2019');
ylabel('Photometrix flux')
