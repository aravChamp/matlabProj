clc
clear
close all


R = 33e3;
C = 2.2e-9;

RC = R*C;

b = [RC, 0];
a = [RC, 1];
w = logspace(-1,1);

h = freqs(b,a,w);
mag = abs(h);
phase = angle(h);
phasedeg = phase*180/pi;

figure;

subplot(2,1,1);
plot(w,mag);
grid on;
xlabel('Frequency (rad/s)');
ylabel('Magnitude');

subplot(2,1,2);
plot(w,phasedeg);
grid on;
xlabel('Frequency (rad/s)');
ylabel('Phase (degrees)');