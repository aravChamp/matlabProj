clc
clear
close all

%Part b

x = 1:7;
m = 2;
downsamp_vec = downsamp(x, m);
d = downsamp_vec;
upsamp_vec = upsamp(x, m);
u = upsamp_vec;

fprintf('Part B: \n');

fprintf('The vector x is: [');
fprintf('%g ', x);
fprintf(']\n');

fprintf('(%s2)x is: [', char(8595));
fprintf('%g ', d);
fprintf(']\n');

fprintf('(%s2)x is: [', char(8593));
fprintf('%g ', u);
fprintf(']\n');

figure

subplot(1, 3, 1)
stem(0:length(x)-1,x);
xlim([0 length(x)-1])
title('x')


subplot(1, 3, 2)
stem(0:length(d)-1, d)
xlim([0 length(d)-1])
title('(\uparrow2)x')

subplot(1, 3, 3)
stem(0:length(u)-1, u)
xlim([0 length(u)-1])
title('(\downarrow2)x')

%Part c

h = [3,2,1,4];

upsamp_vec = upsamp(h, m);
g = upsamp_vec;

downsamp_vec = downsamp(conv(g, x), m);
p = downsamp_vec;

q = conv(h, d);


fprintf('Part C:\n');

fprintf('The vector h is: [');
fprintf('%g ', h);
fprintf(']\n');

fprintf('The vector g is: [');
fprintf('%g ', g);
fprintf(']\n');

fprintf('(%s2)(g*x) is: [', char(8595));
fprintf('%g ', p);
fprintf(']\n');

fprintf('h*((%s2)x) is: [', char(8595));
fprintf('%g ', q);
fprintf(']\n');

%Part d

absoluteDifference = sum(abs(p - q));

fprintf('Part D:\n');

fprintf('The absolute difference between (%s2)(g*x) and h*((%s2)x) is: ', char(8595), char(8595));
fprintf('%d\n', absoluteDifference);

%Part e

upsamp_vec = upsamp(conv(h, x), m);

w = upsamp_vec;

r = conv(g, u);

absoluteDifference = sum(abs(w - r));

fprintf('Part E:\n');

fprintf('(%s2)(h*x) is: [', char(8593));
fprintf('%g ', w);
fprintf(']\n');

fprintf('g*((%s2)x) is: [', char(8593));
fprintf('%g ', r);
fprintf(']\n');

fprintf('The absolute difference between (%s2)(h*x) and g*((%s2)x) is: ', char(8593), char(8593));
fprintf('%d\n', absoluteDifference);

%Part a

function downsamp_vec = downsamp(vector, M)

n = length(vector);

new_n = ceil(n/M);

downsamp_vec = zeros(1, new_n);

for i = 1:new_n
    downsamp_vec(i) = vector((i-1)*M + 1);
end

end

function upsamp_vec = upsamp(vector, M)

upsamp_vec = zeros(1, (length(vector) - 1)*M +1);

upsamp_vec(1:M:(end-1)) = vector(1:end-1);

upsamp_vec(end) = vector(end);

end