clc
clear
close all

%Question 2, Part (a), #6

num = [1, -1.6, 0.81];
den = [1, 0.4, 0.2];


z = roots(num);  
p = roots(den); 

zplane(z, p);

title('Pole-Zero Plot of H(z)');
xlabel('Real Part');
ylabel('Imaginary Part');

%It is minimum phase because all all its poles and zeros are inside the 
%LHP / unit circle.


%Question 2, Part (b)

%1.

N = 10^4;

v = randn(1, N);

x = filter(num, den, v);


%2.


M = 6;
r = zeros(1, M+1);

for m = 0:M
    
    dot_product = dot(x(1:end-m) .* conj(x(m+1:end)), ones(1, N-m));
    
    r(m+1) = dot_product / (N - m);
end

disp('Estimated r[m]:');
disp(r);


%3.

m_range = -6:6;

figure;

stem(m_range, [fliplr(r(2:end)), r], 'filled');

xlabel('m');
ylabel('r_x[m]');
title('r_x[m]');
grid on;


%4.

R_7 = toeplitz(r);

disp('R_7:');
disp(R_7);

%5.

eigenvalues = eig(R_7);

if all(eigenvalues > 0)
    disp("Matrix R is positive definite.");
else
    disp("Matrix R is not positive definite.");
end

%6.

B = zeros(M, N-M+1);

for n = 1:N-M+1
    
    B(:, n) = x(n:M+n-1);
    
end

A = flip(B);

Rhat = A*A' ./ (N-M+1);

Effect = sum(sum(abs(R_7(1:6, 1:6) - Rhat)));


%Part C

%1. 

[s_est,w] = pwelch(x, hamming(512), 256, 512);

figure;
plot(w, s_est);
xlabel('Frequency (Hz)');
ylabel('Power Spectral Density');
title('Power Spectral Density');


%2.

[pks, locs] = findpeaks(s_est);

[~, idx] = max(pks);

w_0 = w(locs(idx));

%3.

theta = angle(p);

%theta values are close but not equal to w_0

%Part D

[a, varv] = aryule(x, 4);

% varv is close to sigma squared value of 2. It is smaller though.

x0 = filter(1, a, v);



r0 = zeros(1, M+1);   

for m = 0:M
    
    dot_product = dot(x0(1:end-m) .* conj(x0(m+1:end)), ones(1, N-m));
    
    r0(m+1) = dot_product / (N - m);
end


disp('Estimated r0[m]:');
disp(r0);

m_range = -6:6;

figure;


stem(m_range, [fliplr(r(2:end)), r], 'filled');

hold on;


stem(m_range, [fliplr(r0(2:end)), r0], 'filled');

title('r[m] (blue) & r_0[m] (red)');

hold off;



x_range = 1:100;

figure;

stem(x_range, x(1:100), 'filled');

hold on;


stem(x_range, x0(1:100), 'filled');

title('x (blue) & x_0 (red)');

hold off;





