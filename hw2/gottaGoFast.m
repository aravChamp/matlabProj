clc
clear
close all

x = linspace(-2*pi, 2*pi, 10001);
y = normalized_sinc(x);
idx = sign_transitions(x);
r = roots(y);
xRoots = real(r);
yRoots = zeros(size(xRoots));
[pks,locs] = findpeaks(y,x);
[pks2,locs2] = findpeaks(-y,x);
minima = -pks2;



plot(x, y);
hold on;
plot(xRoots, yRoots, 'ko');
plot(locs, pks, 'r*');
plot(locs2, minima, 'r*');
hold off;


function y = normalized_sinc(x)

y = zeros(size(x));

for i = 1:length(x)
    if x(i) == 0
        y(i) = 1;
    else
        y(i) = sin(pi*x(i))/(pi*x(i));
    end
end

end

function idx = sign_transitions(x)

idx = find(diff(sign(x)) ~= 0) + 1;

end