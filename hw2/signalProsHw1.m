clc
clear
close all

%part A

n = 6;

rp = 2;

fcrit = [0.5, 0.6];

n0 = n/2;

[z, p, k] = cheby1(n0, rp, fcrit);

zplane(z, p);

[b, a] = zp2tf(z, p, k);

fprintf('Part A:\n');

fprintf('The vector b is: [');
fprintf('%g ', b);
fprintf(']\n');

fprintf('The vector a is: [');
fprintf('%g ', a);
fprintf(']\n');

%part B

f = linspace(0, 40000, 10000);

[H, W] = freqz(b, a, f, 40000);

%part C

Hdb = 20*log10(abs(H));
Hph = unwrap(angle(H))*180/pi;

figure

subplot(2, 1, 1)
plot(f/1e3, Hdb);
grid on;
xlim([0 20000/1e3]);
ylim([-40 2]);
ylabel('Magnitude (dB)');
title('Magnitude and Phase Response of Chebyshev I Filter');

subplot(2, 1, 2)
plot(f/1e3, Hph);
grid on;
xlim([0 20000/1e3]);
ylabel('Phase (degrees)');
xlabel('Frequency (kHz)');

%part D

idx1 = find(f < 10e3 & Hdb >= -30, 1, 'last');
idx2 = find(f > 12e3 & Hdb <= -30, 1, 'first');

fprintf('Gain crosses -30 dB at %f kHz.\n', f(idx1)/1e3);
fprintf('Gain crosses -30 dB at %f kHz.\n', f(idx2)/1e3);


