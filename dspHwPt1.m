clc
clear
close all

%DSP HW 1

%Question 2

%part b/c

N = 512;
fs = 20e6;
f0 = 6e6;

t = (0:499) / fs;
x = [cos(2 * pi * f0 * t), zeros(1, 12)];


window = chebwin(512, 30);
window = window * sqrt(sum(window.^2));
x_win = window .* x';

x_rect_win = x * 0.5;

X_rect = fft(x_rect_win);
X_cheb = fft(x_win);

figure;

subplot(4, 1, 1);
stem(abs(X_rect));
xlabel('Frequency Index');
ylabel('Magnitude');
title('DFT with Rectangular Window (Magnitude)');
grid on;
xlim([1, 512]);

subplot(4, 1, 2);
stem(abs(X_cheb));
xlabel('Frequency Index');
ylabel('Magnitude');
title('DFT with Chebyshev Window (Magnitude)');
grid on;
xlim([1, 512]);


subplot(4, 1, 3);
stem(abs(X_rect));
xlabel('Frequency Index');
ylabel('Magnitude');
title('DFT with Rectangular Window at k_0 = 155 (Magnitude)');
grid on;
xlim([145, 165]);

subplot(4, 1, 4);
stem(abs(X_cheb));
xlabel('Frequency Index');
ylabel('Magnitude');
title('DFT with Chebyshev Window at k_0 = 155 (Magnitude)');
grid on;
xlim([145, 165]);

figure;
stem(abs(X_rect));
xlabel('Frequency Index');
ylabel('Magnitude');
grid on;
hold;
stem(abs(X_cheb));
title('DFT with Rectangular and Chebyshev Window at k_0 = 155 (Magnitude)');
xlim([145, 165]);

%part d

P_s = rms(x)^2;
P_n = P_s/100;

noise = sqrt(P_n) * randn(1, 512);

x_noisy = x + noise;

X_rect = fft(x_noisy/2);

x_win = x_noisy' .* window;

X_cheb = fft(x_win);


XRectDB = fftshift(20*log10(abs(X_rect)));
XChebDB = fftshift(20*log10(abs(X_cheb)));

k = (-N/2):(N/2 - 1);


figure;

subplot(2, 1, 1);
plot(k, XRectDB);
xlabel('Frequency Index');
ylabel('Magnitude');
title('DFT with Rectangular Window (Magnitude)');
grid on;


subplot(2, 1, 2);
plot(k, XChebDB);
xlabel('Frequency Index');
ylabel('Magnitude');
title('DFT with Chebyshev Window (Magnitude)');
grid on;

figure;
plot(k, XRectDB);
hold;
plot(k, XChebDB, 'r');
xlabel('Frequency Index');
ylabel('Magnitude');
title('Superimposed Graph');
legend('Rectangular Window', 'Chebyshev Window');
grid on;
xlim([145, 165]);




