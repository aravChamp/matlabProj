clc
clear
close all

syms f W T A

Y = A * T * exp((-log(2) / 2) * (f / W)^2 - 1i * pi * f * T) * sinc(pi * f * T);

magnitude_Y_dB = 20 * log10(abs(Y));

magnitude_Y_dB_function = matlabFunction(magnitude_Y_dB, 'Vars', [f, W, T, A]);

W_val = 1;
T_val = 0.25;
A_val = 1 / T_val;

f_values = linspace(-4, 4, 1000); % Adjust the range and resolution as needed

magnitude_spectrum = magnitude_Y_dB_function(f_values, W_val, T_val, A_val);

figure;
plot(f_values, magnitude_spectrum);
xlabel('Frequency (f)');
ylabel('|Y(f)| (dB)');
title('Magnitude Spectrum of Y(f) in Decibels');
grid on;
