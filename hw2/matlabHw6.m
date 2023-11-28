clc
clear
close all

%Zzz


num = [1/2, 2/3, 3/7];
den = [2, 1/3, 1/2];

%part a

[z, p, k] = tf2zp(num, den);

%part b
figure
zplane(z, p);

%part c
impulse_response = impz(num, den, 50);
figure
stem(impulse_response);

%part d
n = 0:49;
x = -0.5.^n;

y = filter(num, den, x);

figure
subplot(2,1,1);
stem(n, x);
xlabel('n');
ylabel('x');
title('Input Signal x');

subplot(2,1,2);
stem(n, y);
xlabel('n');
ylabel('y');
title('Output Signal y');

%part e

y = conv(num, x);
y = y(1:length(x)) ./ den(1); 

figure

subplot(2,1,1);
stem(n, x);
xlabel('n');
ylabel('x');
title('Input Signal x');

subplot(2,1,2);
stem(n, y);
xlabel('n');
ylabel('y');
title('Output Signal y');

%fibanochi

% part a
h = zeros(1, 100);
h(1) = 0;
h(2) = 1;

for n = 3:100
    h(n) = h(n-1) + h(n-2);
end

figure

semilogy(0:99, h, '.');
xlabel('n');
ylabel('h(n)');
title('Impulse Response of Fibonacci System');

%part b

%The difference equation governing the system is y(n) = x(n) + x(n-1)
%z transform: Y(z) = X(z) + z^{-1}X(z)
%transfer function: H(z) = Y(z)/X(z) = 1 + z^{-1}
% 1 pole at zero and No zeroes

num = [1 1];
den = [1 0];

figure
zplane(num, den);

%system is causal because the difference equation only uses past and present values of the input and output.
%system is stable because the pole is at z = 0 -> inside the unit circle






