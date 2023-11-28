clc
clear
close all

wp1 = 9e6;
wp2 = 12.5e6;

ws1 = 9.5e6;
ws2 = 12e6;

rp = 1.5;
rs = 40;

fs = 40e6;

Wp = [wp1, wp2] / (fs/2);
Ws = [ws1, ws2] / (fs/2);

%w = linspace(0, 2*pi*20e6, 1000);


% Case I: Butterworth

%Digital Butterworth

[n_butter, Wn_butter] = buttord(Wp, Ws, rp, rs);

[z_butter, p_butter, ~] = butter(n_butter, Wn_butter, 'stop');

f = linspace(0, 20e6, 1000);

fMHz = f/1e6;

[H_butter, ~]= freqz(poly(z_butter), poly(p_butter), f, fs);

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


%Analog Butterworth 

[n_butter_analog, Wn_butter_analog] = buttord(2*pi*Wp*(fs/2), 2*pi*Ws*(fs/2), rp, rs, 's');

[z_butter_analog, p_butter_analog, ~] = butter(n_butter_analog, Wn_butter_analog, 'stop', 's');

[H_butter_analog, ~]= freqs(poly(z_butter_analog), poly(p_butter_analog), 2*pi*fMHz*1e6);

mag_dB_butter_analog = 20 * log10(abs(H_butter_analog));

phaseAng_butter_analog = unwrap(angle(H_butter_analog)) * 180 / pi;

figure('name', 'Analog Butterworth Filter');

subplot(2, 1, 1);
plot(fMHz, mag_dB_butter_analog, 'b');
title('Magnitude Response');
xlabel('Frequency (MHz)');
ylabel('Magnitude (dB)');

subplot(2, 1, 2);
plot(fMHz, phaseAng_butter_analog, 'r');
title('Phase Response');
xlabel('Frequency (MHz)');
ylabel('Phase (degrees)');

disp('Analog Butterworth Filter:');
disp('Filter Order:');
disp(n_butter_analog*2);
disp('Peak Passband gain:');
disp(max(mag_dB_butter_analog));
disp('Gain at 9Mhz:');
disp(mag_dB_butter_analog(450));
disp('Gain at 12.5Mhz:');
disp(mag_dB_butter_analog(625));

% Case II: Chebyshev I

%Digital Chebyshev I

[n_cheb1, Wn_cheb1] = cheb1ord(Wp, Ws, rp, rs);

[z_cheb1, p_cheb1, ~] = cheby1(n_cheb1, rp, Wn_cheb1, 'stop');


[H_cheb1, ~]= freqz(poly(z_cheb1), poly(p_cheb1), f, fs);

mag_dB_cheb1 = 20 * log10(abs(H_cheb1));

phaseAng_cheb1 = unwrap(angle(H_cheb1)) * 180 / pi;

figure('name', 'Digital Chebyshev I Filter');

subplot(2, 1, 1);
plot(fMHz, mag_dB_cheb1, 'b');
title('Magnitude Response');
xlabel('Frequency (MHz)');
ylabel('Magnitude (dB)');
%ylim([-50, 2]); % Set the vertical axis range

subplot(2, 1, 2);
plot(fMHz, phaseAng_cheb1, 'r');
title('Phase Response');
xlabel('Frequency (MHz)');
ylabel('Phase (degrees)');

disp('Digital Chebyshev I:');
disp('Filter Order:');
disp(n_cheb1*2);
disp('Peak Passband gain:');
disp(max(mag_dB_cheb1));
disp('Gain at 9Mhz:');
disp(mag_dB_cheb1(450));
disp('Gain at 12.5Mhz:');
disp(mag_dB_cheb1(625));

%Analog Chebyshev I

[n_cheb1_analog, Wn_cheb1_analog] = cheb1ord(Wp, Ws, rp, rs, 's');

[z_cheb1_analog, p_cheb1_analog, ~] = cheby1(n_cheb1, rp, Wn_cheb1, 'stop', 's');


[H_cheb1_analog, ~]= freqs(poly(z_cheb1_analog), poly(p_cheb1_analog), 1000);

mag_dB_cheb1_analog = 20 * log10(abs(H_cheb1_analog));

phaseAng_cheb1_analog = unwrap(angle(H_cheb1_analog)) * 180 / pi;

figure('name', 'Analog Chebyshev I Filter');

subplot(2, 1, 1);
plot(fMHz, mag_dB_cheb1_analog, 'b');
title('Magnitude Response');
xlabel('Frequency (MHz)');
ylabel('Magnitude (dB)');

subplot(2, 1, 2);
plot(fMHz, phaseAng_cheb1_analog, 'r');
title('Phase Response');
xlabel('Frequency (MHz)');
ylabel('Phase (degrees)');

disp('Analog Chebyshev I:');
disp('Filter Order:');
disp(n_cheb1_analog*2);
disp('Peak Passband gain:');
disp(max(mag_dB_cheb1_analog));
disp('Gain at 9Mhz:');
disp(mag_dB_cheb1_analog(450));
disp('Gain at 12.5Mhz:');
disp(mag_dB_cheb1_analog(625));

%Case III: Chebyshev II

%Digital Chebyshev II

[n_cheb2, Wn_cheb2] = cheb2ord(Wp, Ws, rp, rs);

[z_cheb2, p_cheb2, ~] = cheby2(n_cheb2, rs, Wn_cheb2, 'stop');


[H_cheb2, ~]= freqz(poly(z_cheb2), poly(p_cheb2), f, fs);

mag_dB_cheb2 = 20 * log10(abs(H_cheb2));

phaseAng_cheb2 = unwrap(angle(H_cheb2)) * 180 / pi;

figure('name', 'Digital Cheybshev II Filter');

subplot(2, 1, 1);
plot(fMHz, mag_dB_cheb2, 'b');
title('Magnitude Response');
xlabel('Frequency (MHz)');
ylabel('Magnitude (dB)');
%ylim([-50, 2]); % Set the vertical axis range

subplot(2, 1, 2);
plot(fMHz, phaseAng_cheb2, 'r');
title('Phase Response');
xlabel('Frequency (MHz)');
ylabel('Phase (degrees)');

disp('Digital Chebyshev II Filter:');
disp('Filter Order:');
disp(n_cheb2*2);
disp('Peak Passband gain:');
disp(max(mag_dB_cheb2));
disp('Gain at 9Mhz:');
disp(mag_dB_cheb2(450));
disp('Gain at 12.5Mhz:');
disp(mag_dB_cheb2(625));

%Analog Chebyshev II

[n_cheb2_analog, Wn_cheb2_analog] = cheb2ord(Wp, Ws, rp, rs);

[z_cheb2_analog, p_cheb2_analog, ~] = cheby2(n_cheb2_analog, rs, Wn_cheb2_analog, 'stop', 's');


[H_cheb2_analog, ~]= freqs(poly(z_cheb2_analog), poly(p_cheb2_analog), 1000);

mag_dB_cheb2_analog = 20 * log10(abs(H_cheb2_analog));

phaseAng_cheb2_analog = unwrap(angle(H_cheb2_analog)) * 180 / pi;

figure('name', 'Analog Cheybshev II Filter');

subplot(2, 1, 1);
plot(fMHz, mag_dB_cheb2_analog, 'b');
title('Magnitude Response');
xlabel('Frequency (MHz)');
ylabel('Magnitude (dB)');
%ylim([-50, 2]); % Set the vertical axis range

subplot(2, 1, 2);
plot(fMHz, phaseAng_cheb2_analog, 'r');
title('Phase Response');
xlabel('Frequency (MHz)');
ylabel('Phase (degrees)');

disp('Analog Chebyshev II Filter:');
disp('Filter Order:');
disp(n_cheb2_analog*2);
disp('Peak Passband gain:');
disp(max(mag_dB_cheb2_analog));
disp('Gain at 9Mhz:');
disp(mag_dB_cheb2_analog(450));
disp('Gain at 12.5Mhz:');
disp(mag_dB_cheb2_analog(625));

%Case IV: Elliptic

%Digital elliptic filter

[n_ellip, Wn_ellip] = ellipord(Wp, Ws, rp, rs);

[z_ellip, p_ellip, ~] = ellip(n_ellip, rp, rs, Wp, 'stop');


[H_ellip, ~]= freqz(poly(z_ellip), poly(p_ellip), f, fs);

mag_dB_ellip = 20 * log10(abs(H_ellip));

phaseAng_ellip = unwrap(angle(H_ellip)) * 180 / pi;

figure('name', 'Digital Elliptic Filter');

subplot(2, 1, 1);
plot(fMHz, mag_dB_ellip, 'b');
title('Magnitude Response');
xlabel('Frequency (MHz)');
ylabel('Magnitude (dB)');
%ylim([-50, 2]); % Set the vertical axis range

subplot(2, 1, 2);
plot(fMHz, phaseAng_ellip, 'r');
title('Phase Response');
xlabel('Frequency (MHz)');
ylabel('Phase (degrees)');

disp('Digital Elliptic Filter:');
disp('Filter Order:');
disp(n_ellip*2);
disp('Peak Passband gain:');
disp(max(mag_dB_ellip));
disp('Gain at 9Mhz:');
disp(mag_dB_ellip(450));
disp('Gain at 12.5Mhz:');
disp(mag_dB_ellip(625));

%Analog Elliptic Filter

[n_ellip_analog, Wn_ellip_analog] = ellipord(Wp, Ws, rp, rs, 's');

[z_ellip_analog, p_ellip_analog, ~] = ellip(n_ellip_analog, rp, rs, Wp, 'stop', 's');


[H_ellip_analog, ~]= freqs(poly(z_ellip_analog), poly(p_ellip_analog), 1000);

mag_dB_ellip_analog = 20 * log10(abs(H_ellip_analog));

phaseAng_ellip_analog = unwrap(angle(H_ellip_analog)) * 180 / pi;

figure('name', 'Analog Elliptic Filter');

subplot(2, 1, 1);
plot(fMHz, mag_dB_ellip_analog, 'b');
title('Magnitude Response');
xlabel('Frequency (MHz)');
ylabel('Magnitude (dB)');
%ylim([-50, 2]); % Set the vertical axis range

subplot(2, 1, 2);
plot(fMHz, phaseAng_ellip_analog, 'r');
title('Phase Response');
xlabel('Frequency (MHz)');
ylabel('Phase (degrees)');

disp('Analog Elliptic Filter:');
disp('Filter Order:');
disp(n_ellip_analog*2);
disp('Peak Passband gain:');
disp(max(mag_dB_ellip_analog));
disp('Gain at 9Mhz:');
disp(mag_dB_ellip_analog(450));
disp('Gain at 12.5Mhz:');
disp(mag_dB_ellip_analog(625));
