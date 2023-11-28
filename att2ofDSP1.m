% Sampling rate and signal parameters
Fs = 20e6;             % Sampling rate of 20 MHz
f_signal = 6e6;        % Frequency of the sine wave at 6 MHz
N = 512;               % Number of samples

% Generate the real sine wave signal
t = (0:N-1) / Fs;      % Time vector
x_signal = cos(2 * pi * f_signal * t);  % Real sine wave signal

% Pad with zeros to create a 512-point signal
x_padded = [x_signal, zeros(1, 512 - N)];

% Generate white Gaussian noise with specified SNR
SNR_dB = 20; % Signal-to-Noise Ratio (SNR) in dB
signal_power = rms(x_signal)^2; % Compute signal power
noise_power = signal_power / (10^(SNR_dB/10)); % Compute noise power
noise = sqrt(noise_power) * randn(1, length(x_padded));

% Corrupt the signal with noise
x_corrupted = x_padded + noise;

% Compute the DFT using a rectangular window
X_rectangular = fft(x_corrupted);

% Compute the DFT using the same Chebyshev window as before
window_length = length(x_corrupted);
window = chebwin(window_length, 30); % Chebyshev window with 30 dB sidelobe
window = window / sqrt(sum(abs(window).^2)); % Scale the window for unit energy
x_windowed = x_corrupted .* window'; % Apply the window to the signal
X_chebyshev = fft(x_windowed);

% Frequency axis
f_axis = (-Fs/2):(Fs/window_length):(Fs/2 - Fs/window_length);

% Plot the magnitude spectrum in dB for each window
figure;

% Rectangular window
subplot(2, 1, 1);
plot(f_axis, 20*log10(abs(fftshift(X_rectangular))));
xlabel('Frequency (Hz)');
ylabel('|X(f)| (dB)');
title('DFT with Rectangular Window');
grid on;

% Chebyshev window
subplot(2, 1, 2);
plot(f_axis, 20*log10(abs(fftshift(X_chebyshev))));
xlabel('Frequency (Hz)');
ylabel('|X(f)| (dB)');
title('DFT with Chebyshev Window');
grid on;

% Superimposed graph for the specified frequency range (155 +- 10 Hz)
figure;
range_indices = find(f_axis >= 155 - 10 & f_axis <= 155 + 10);
plot(f_axis(range_indices), 20*log10(abs(fftshift(X_rectangular(range_indices)))), 'b', 'DisplayName', 'Rectangular Window');
hold on;
plot(f_axis(range_indices), 20*log10(abs(fftshift(X_chebyshev(range_indices)))), 'r', 'DisplayName', 'Chebyshev Window');
xlabel('Frequency (Hz)');
ylabel('|X(f)| (dB)');
title('Superimposed DFT for 155 Hz Range');
legend('Location', 'NorthEast');
grid on;