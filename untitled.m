clc
clear
close all

%passband frequencies

fp1 = 9e6;
fp2 = 12.5e6;

%stopband frequencies

fs1 = 9.5e6;
fs2 = 12e6;

rp = 1.5;  %passband deviation
rs = 40;   %stop band deviation

fs = 40e6;  %sampling frequency

%digital normalized frequencies

Fp = [fp1, fp2] / (fs/2);
Fs = [fs1, fs2] / (fs/2);

%x-axis for plotting

f = linspace(0, 20e6, 1000); %for digital
w = 2*pi*f; %for analog

fMHz = f/1e6;

%radian frequencies for analog filters
Wp = 2*pi*Fp*(fs/2);
Ws = 2*pi*Fs*(fs/2);



%Case I: Digital Butterworth Filter

[n_butter, Wn_butter] = buttord(Fp, Fs, rp, rs);

[z_butter, p_butter, ~] = butter(n_butter, Wn_butter, 'stop');

[H_butter, ~] = freqz(poly(z_butter), poly(p_butter), f, fs);

mag_dB_butter = 20 * log10(abs(H_butter));

phaseAng_butter = unwrap(angle(H_butter)) * 180 / pi;

figure('name', 'Digital Butterworth Filter');

subplot(2, 1, 1);
plot(fMHz, mag_dB_butter, 'b');
title('Magnitude Response');
xlabel('Frequency (MHz)');
ylabel('Magnitude (dB)');

subplot(2, 1, 2);
plot(fMHz, phaseAng_butter, 'r');
title('Phase Response');
xlabel('Frequency (MHz)');
ylabel('Phase (degrees)');

disp('Digital Butterworth Filter:');
disp('Filter Order:');
disp(n_butter*2);
disp('Peak Passband gain:');
disp(max(mag_dB_butter));
disp('Gain at 9Mhz:');
disp(mag_dB_butter(450));
disp('Gain at 12.5Mhz:');
disp(mag_dB_butter(625));



