%% Opagve 5  %
 clear; clc

 % import fil
[s_telephone_dial_up, fsample] = audioread('Telephone_dial_up.wav');

Tsample = 1/fsample;  % sampletid

N_telephone_dial_up = length(s_telephone_dial_up); % antal punkter

t_axis = [0:Tsample:Tsample*(N_telephone_dial_up-1)];  % tidsakse

s_telephone_dial_up_norm = s_telephone_dial_up/max(abs(s_telephone_dial_up));  % normalisering

% ***** Fourier Transformation *********************************

S_telephone_dial_up = fft(s_telephone_dial_up_norm, N_telephone_dial_up);  % DFT'en udf�res

delta_f = fsample/N_telephone_dial_up;  % frekvensopl�sning

f_axis = [0:delta_f:fsample-delta_f];  % frekvensakse

% ***** Frekvensspektre (magnitude) ***********************************
S_telephone_dial_up_MAGdB = 20*log10(abs((2/N_telephone_dial_up)*S_telephone_dial_up));

figure(1); clf
semilogx(f_axis(1:0.5*end), S_telephone_dial_up_MAGdB(1:0.5*end))
xlabel('Frekvens i Hertz (op til Nyquist frekvensen)')
ylabel('Størrelse dB rel. 1 Volt')
title('DFT størrelse (magnitude)')
axis([10 inf -120 -20])
grid on
hold on

S_telephone_dial_up_smooth = raw_smooth(S_telephone_dial_up', 31);
S_telephone_dial_up_smoothdB = 20*log10(abs((2/N_telephone_dial_up)*S_telephone_dial_up_smooth));

semilogx(f_axis(1:0.5*end), S_telephone_dial_up_smoothdB(1:0.5*end),'r','linewidth',2)

sc = semilogx(f_axis(1:0.5*end), S_telephone_dial_up_smoothdB(1:0.5*end),'r','linewidth',2);
xlabel('Frekvens i Hertz (op til Nyquist frekvensen)')
ylabel('Størrelse dB rel. 1 Volt')
title('DFT størrelse (magnitude)')
axis([10 inf -120 -20])
legend('DFT','Raw-Smooth(DFT)')
datatip(sc,697,-50);
datatip(sc,770,-50);
datatip(sc,825,-58);
datatip(sc,1209,-29);
datatip(sc,1336,-37);
datatip(sc,1477,-35);
%% Opgave 6 &
 clear; clc

 % import fil
[s_compressor_motor_in_workshop, fsample_compressor_motor_in_workshop] = audioread('compressor_motor_in_workshop.wav');
[s_relaxing_short_music, fsample_relaxing_short_music] = audioread('relaxing_short_music.mp3');
[s_straget_wine_glass_sound, fsample_straget_wine_glass_sound] = audioread('straget_wine_glass_sound.wav');

Tsample_compressor_motor_in_workshop = 1/fsample_compressor_motor_in_workshop;  % sampletid
Tsample_relaxing_short_music = 1/fsample_relaxing_short_music;  % sampletid
Tsample_straget_wine_glass_sound = 1/fsample_straget_wine_glass_sound;  % sampletid

s_compressor_motor_in_workshop = s_compressor_motor_in_workshop(:,1);
s_relaxing_short_music = s_relaxing_short_music(:,1);
s_straget_wine_glass_sound = s_straget_wine_glass_sound(:,1);

N_compressor_motor_in_workshop = length(s_compressor_motor_in_workshop); % antal punkter
N_relaxing_short_music  = length(s_relaxing_short_music ); % antal punkter
N_straget_wine_glass_sound = length(s_straget_wine_glass_sound); % antal punkter

t_axis_compressor_motor_in_workshop = [0:Tsample_compressor_motor_in_workshop:Tsample_compressor_motor_in_workshop*(N_compressor_motor_in_workshop-1)];  % tidsakse
t_axis_relaxing_short_music = [0:Tsample_relaxing_short_music:Tsample_relaxing_short_music*(N_relaxing_short_music-1)];  % tidsakse
t_axis_straget_wine_glass_sound = [0:Tsample_straget_wine_glass_sound:Tsample_straget_wine_glass_sound*(N_straget_wine_glass_sound-1)];  % tidsakse

s_compressor_motor_in_workshop_norm = s_compressor_motor_in_workshop/max(abs(s_compressor_motor_in_workshop));  % normalisering
s_relaxing_short_music_norm = s_relaxing_short_music/max(abs(s_relaxing_short_music));  % normalisering
s_straget_wine_glass_sound_norm = s_straget_wine_glass_sound/max(abs(s_straget_wine_glass_sound));  % normalisering

% ***** Fourier Transformation *********************************

S_compressor_motor_in_workshop = fft(s_compressor_motor_in_workshop_norm, N_compressor_motor_in_workshop);  % DFT'en udf�res
S_relaxing_short_music = fft(s_relaxing_short_music_norm, N_relaxing_short_music);  % DFT'en udf�res
S_straget_wine_glass_sound = fft(s_straget_wine_glass_sound_norm, N_straget_wine_glass_sound);  % DFT'en udf�res

delta_f_compressor_motor_in_workshop = fsample_compressor_motor_in_workshop/N_compressor_motor_in_workshop;  % frekvensopl�sning
delta_f_relaxing_short_music = fsample_relaxing_short_music/N_relaxing_short_music;  % frekvensopl�sning
delta_f_straget_wine_glass_sound = fsample_straget_wine_glass_sound/N_straget_wine_glass_sound;  % frekvensopl�sning

f_axis_compressor_motor_in_workshop = [0:delta_f_compressor_motor_in_workshop:fsample_compressor_motor_in_workshop-delta_f_compressor_motor_in_workshop];  % frekvensakse
f_axis_relaxing_short_music = [0:delta_f_relaxing_short_music:fsample_relaxing_short_music-delta_f_relaxing_short_music];  % frekvensakse
f_axis_straget_wine_glass_sound = [0:delta_f_straget_wine_glass_sound:fsample_straget_wine_glass_sound-delta_f_straget_wine_glass_sound];  % frekvensakse

% ***** Frekvensspektre (magnitude) ***********************************
S_compressor_motor_in_workshop_MAGdB = 20*log10(abs((2/N_compressor_motor_in_workshop)*S_compressor_motor_in_workshop));

figure(2); clf
semilogx(f_axis_compressor_motor_in_workshop(1:0.5*end), S_compressor_motor_in_workshop_MAGdB(1:0.5*end))
axis([0 inf -120 -20])
grid on
hold on

S_compressor_motor_in_workshop_smooth = raw_smooth(S_compressor_motor_in_workshop', 21);
S_compressor_motor_in_workshop_smoothdB = 20*log10(abs((2/N_compressor_motor_in_workshop)*S_compressor_motor_in_workshop_smooth));

sc = semilogx(f_axis_compressor_motor_in_workshop(1:0.5*end), S_compressor_motor_in_workshop_smoothdB(1:0.5*end),'r','linewidth',2);
xlabel('Frekvens i Hertz (op til Nyquist frekvensen)')
ylabel('Størrelse dB rel. 1 Volt')
title('DFT størrelse (magnitude) kompressor lydklip')
axis([0 inf -120 -20])
legend('DFT','Raw-Smooth(DFT)')

S_relaxing_short_music_MAGdB = 20*log10(abs((2/N_relaxing_short_music)*S_relaxing_short_music));

figure(3); clf
semilogx(f_axis_relaxing_short_music(1:0.5*end), S_relaxing_short_music_MAGdB(1:0.5*end))
axis([10 inf -120 -20])
grid on
hold on

S_relaxing_short_music_smooth = raw_smooth(S_relaxing_short_music', 21);
S_relaxing_short_music_smoothdB = 20*log10(abs((2/N_relaxing_short_music)*S_relaxing_short_music_smooth));

sc = semilogx(f_axis_relaxing_short_music(1:0.5*end), S_relaxing_short_music_smoothdB(1:0.5*end),'r','linewidth',2);
xlabel('Frekvens i Hertz (op til Nyquist frekvensen)')
ylabel('Størrelse dB rel. 1 Volt')
title('DFT størrelse (magnitude) musik lydklip')
axis([10 inf -120 -20])
legend('DFT','Raw-Smooth(DFT)')

S_straget_wine_glass_sound_MAGdB = 20*log10(abs((2/N_straget_wine_glass_sound)*S_straget_wine_glass_sound));

figure(4); clf
semilogx(f_axis_straget_wine_glass_sound(1:0.5*end), S_straget_wine_glass_sound_MAGdB(1:0.5*end))
axis([10 inf -120 -20])
grid on
hold on

S_straget_wine_glass_sound_smooth = raw_smooth(S_straget_wine_glass_sound', 21);
S_straget_wine_glass_sound_smoothdB = 20*log10(abs((2/N_straget_wine_glass_sound)*S_straget_wine_glass_sound_smooth));

sc = semilogx(f_axis_straget_wine_glass_sound(1:0.5*end), S_straget_wine_glass_sound_smoothdB(1:0.5*end),'r','linewidth',2);
xlabel('Frekvens i Hertz (op til Nyquist frekvensen)')
ylabel('Størrelse dB rel. 1 Volt')
title('DFT størrelse (magnitude) vinglas lydklip')
axis([10 inf -120 -20])
legend('DFT','Raw-Smooth(DFT)')

