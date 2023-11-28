clc
clear
close all

x = linspace(0, 1, 100);
y = exp(x);

integral_trapz = trapz(x, y) * (x(end) - x(1));

midpoints = (x(1:end-1) + x(2:end)) / 2;
integral_rect = sum(y(1:end-1) .* (x(2:end) - x(1:end-1))) * (x(end) - x(1));

cumulative_integral_trapz = cumtrapz(x, y);

cumulative_integral_rect = cumsum(y(1:end-1) .* (x(2:end) - x(1:end-1)));

dy_dx = (y(2:end) - y(1:end-1)) ./ (x(2:end) - x(1:end-1));

dy_dx = [0, dy_dx]; % add one more value to match the length of y and x
d2y_dx2 = (dy_dx(2:end) - dy_dx(1:end-1)) ./ (x(2:end) - x(1:end-1));

original_vector = [0 1 2 3 4 5];
new_vector = circshift(original_vector, -3);