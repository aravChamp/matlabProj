clc
clear
close all

%part A

t = 0:0.001:2;


f = 1:50000;

x = sum(sin(2*pi*f'*t), 1);

%part B


Fs = 100000;  
Fpass = 10000;  
Fstop = 20000;  
Apass = 5;  
Astop = 50;  


[N, Wn] = buttord(2*Fpass/Fs, 2*Fstop/Fs, Apass, Astop);
[b, a] = butter(N, Wn);



y = filter(b, a, x);


Y = fft(y);
f = (0:length(Y)-1)*Fs/length(Y);
figure;
plot(f, abs(Y));
xlim([0 Fs]);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Fourier Transform Butterworth');


%part C


Fs = 100000;  
Fpass = 35000;  
Fstop = 15000;  
Apass = 2; 
Astop = 40; 
Wp = 2*Fpass/Fs;  
Ws = 2*Fstop/Fs; 


[N, Wn] = cheb1ord(Wp, Ws, Apass, Astop);
[b, a] = cheby1(N, Apass, Wn, 'high');

y = filter(b, a, x);



Y = fft(y);
f = (0:length(Y)-1)*Fs/length(Y);
figure;
plot(f, abs(Y));
xlim([0 Fs]);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Fourier Transform Cheby I');


%Part D

Fs = 100000; 
Fpass1 = 5000;  
Fpass2 = 45000;  
Fstop1 = 15000;  
Fstop2 = 35000;  
Apass = 5;  
Astop = 50;  
Wp1 = 2*Fpass1/Fs;  
Wp2 = 2*Fpass2/Fs;  
Ws1 = 2*Fstop1/Fs;  
Ws2 = 2*Fstop2/Fs;  

[N, Wn] = cheb2ord([Wp1, Wp2], [Ws1, Ws2], Apass, Astop);
[b, a] = cheby2(N, Astop, Wn);

y = filter(b, a, x);


Y = fft(y);
f = (0:length(Y)-1)*Fs/length(Y);
figure;
plot(f, abs(Y));
xlim([0 Fs/2]);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Fourier Transform Cheby II');

%Part E


Wp = [2*20000/Fs, 2*30000/Fs];
Ws = [2*15000/Fs, 2*35000/Fs];
Rp = 5;
Rs = 50;
[n, Wn] = ellipord(Wp, Ws, Rp, Rs);
[b, a] = ellip(n, Rp, Rs, Wn, 'bandpass');


y = filter(b, a, x);


Y = fft(y);
f = (0:length(Y)-1)*Fs/length(Y);
figure;
plot(f, abs(Y));
xlim([0 Fs/2]);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Fourier Transform (Elliptic)');

