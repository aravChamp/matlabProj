clc
clear
close all

K0 = 4 - (2 * sqrt(2));

Kmax = 4;

K1 = K0;

K2 = (0.5 * K0) + (0.5 * Kmax);

K3 = (0.2 * K0) + (0.8 * Kmax);


RC = 1e-5;

b1 = [K1/RC];
a1 = [1, ((4-K1)/(RC))^2, 2/(RC^2)];

b2 = [K2/RC];
a2 = [1, ((4-K2)/(RC))^2, 2/(RC^2)];

b3 = [K3/RC];
a3 = [1, ((4-K3)/(RC))^2, 2/(RC^2)];

f = linspace(0, 1e6, 10000);

h1 = freqs(b1,a1,f*2*pi);

h2 = freqs(b2,a2,f*2*pi);

h3 = freqs(b3,a3,f*2*pi);

Hdb1 = 20*log10(abs(h1));

Hph1 = unwrap(angle(h1))*180/pi;

Hdb2 = 20*log10(abs(h2));

Hph2 = unwrap(angle(h2))*180/pi;

Hdb3 = 20*log10(abs(h3));

Hph3 = unwrap(angle(h3))*180/pi;

%part A

figure

subplot(2, 1, 1)
plot(f/1e3, Hdb1);
grid on;
ylabel('Magnitude (dB)');
title('Magnitude and Phase Response for K=K1');

subplot(2, 1, 2)
plot(f/1e3, Hph1);
grid on;
ylabel('Phase (degrees)');
xlabel('Frequency (kHz)');

figure

subplot(2, 1, 1)
plot(f/1e3, Hdb2);
grid on;
ylabel('Magnitude (dB)');
title('Magnitude and Phase Response for K=K2');

subplot(2, 1, 2)
plot(f/1e3, Hph2);
grid on;
ylabel('Phase (degrees)');
xlabel('Frequency (kHz)');

figure

subplot(2, 1, 1)
plot(f/1e3, Hdb3);
grid on;
ylabel('Magnitude (dB)');
title('Magnitude and Phase Response for K=K3');

subplot(2, 1, 2)
plot(f/1e3, Hph3);
grid on;
ylabel('Phase (degrees)');
xlabel('Frequency (kHz)');

%part B

w = logspace(3, 6, 10000);

figure

subplot(2, 1, 1)
semilogx(f/1e3, Hdb1);
grid on;
ylabel('Magnitude (dB)');
title('Bode plots for K=K1');

subplot(2, 1, 2)
semilogx(f/1e3, Hph1);
grid on;
ylabel('Phase (degrees)');
xlabel('Frequency (kHz)');

figure

subplot(2, 1, 1)
semilogx(f/1e3, Hdb2);
grid on;
ylabel('Magnitude (dB)');
title('Bode plots for K=K2');

subplot(2, 1, 2)
semilogx(f/1e3, Hph2);
grid on;
ylabel('Phase (degrees)');
xlabel('Frequency (kHz)');

figure

subplot(2, 1, 1)
semilogx(f/1e3, Hdb3);
grid on;
ylabel('Magnitude (dB)');
title('Bode plots for K=K3');

subplot(2, 1, 2)
semilogx(f/1e3, Hph3);
grid on;
ylabel('Phase (degrees)');
xlabel('Frequency (kHz)');

%part C

Wn = sqrt(2) / RC;

Q1 = sqrt(2) / K1;

Q2 = sqrt(2) / K2;

Q3 = sqrt(2) / K3;


%part D

pks1 = findpeaks(Hdb1);

pks2 = findpeaks(Hdb2);

pks3 = findpeaks(Hdb3);

%part E

%Sorry professor I could not get peaks from this..


