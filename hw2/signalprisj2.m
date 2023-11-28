clc
clear
close all

K0 = 4 - 2 * sqrt(2);

Kmax = 4;

K2 = (0.5 * K0) + (0.5 * Kmax);

K3 = (0.2 * K0) + (0.8 * Kmax);

K = [K0 K2 K3];

RC = 1e-5;

Wn = sqrt(2) / RC;

Q = sqrt(2) ./ K;

b = K ./ RC;

a = ones(3);

a(:,2) = Wn./Q;

a(:,3) = [Wn^2, Wn^2, Wn^2]; 

H1 = freqs(b(1), a(1), 1e4);

H2 = freqs(b(2), a(3), 1e4);

H3 = freqs(b(3), a(3), 1e4);

