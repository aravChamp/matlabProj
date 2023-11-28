clc
clear
close all

%Question 3

%Part A

fs = 44.1e3;

N0 = round(fs/2); %length of blocks

s = N0 * 50 - 1; %we want 100 blocks with 50 percent overlap

f1 = 393;
f2 = 440;
f3 = 587.33;

t = (0:s) / fs;

x1 = cos(2 * pi * f1 * t);
x2 = cos(2 * pi * f2 * t);
x3 = cos(2 * pi * f3 * t);

x = [x1; x2; x3];

bitmask = [0 1 1; 1 0 1; 1 1 0];

r = randi([1 3], 1, s+1);

impBM = zeros(3, s+1);

for i = 1:s
    
    impBM(:, i) = bitmask(:, r(i));
    
end

impBM = impBM .* x;

notes_clean = sum(impBM);

P_s = rms(notes_clean)^2;
P_n = P_s/10000;
noise = sqrt(P_n) * randn(1, s+1);

notes = notes_clean + noise;

%Part B

window = hamming(N0);

N = 2^nextpow2(N0);

[Periodogram, f] = pwelch(notes, window, N0/2, N, fs);


%Part C

figure;
subplot(2, 1, 1);
plot(f, Periodogram);
title('Periodogram (Linear Scale)');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency');
grid on;
xlim([0, fs/2]);


subplot(2, 1, 2);
plot(f, 10*log10(Periodogram));
title('Periodogram (Decibel Scale)');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB)');
grid on;
xlim([0, fs/2]);

% Zoomed In
figure;
plot(f, 10*log10(Periodogram));
title('Zoom-in: Periodogram (Decibel Scale)');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB)');
grid on;
xlim([300, 600]);

%Part D

[S, F, T] = spectrogram(notes, window, N0/2, N, fs);

SdB = 10 * log10(abs(S));

[T_grid, F_grid] = meshgrid(T, F);

figure;

mesh(T_grid, F_grid, SdB);
colormap hsv;

title('Spectrogram');
xlabel('Time (s)');
ylabel('Frequency (Hz)');
ylim([300 700]);
view(2); % 2D view





