clc
clear
close all

M = 1000000;

x = randn(M, 1);

y = trnd(5, M, 1) * 3/5;

z = 0.554 * tan (pi * rand(M, 1));


abs_below_1 = abs(x) < 1; 
x_below_1 = sum(abs_below_1(:)) / numel(x);

abs_below_1 = abs(y) < 1; 
y_below_1 = sum(abs_below_1(:)) / numel(y);

abs_below_1 = abs(z) < 1; 
z_below_1 = sum(abs_below_1(:)) / numel(z);

n = ones(M, 1);

figure;
scatter(1:M, x);

hold on;

scatter(1:M, n, '.');

n = n * -1;

scatter(1:M, n, '.');

hold off;


figure;
scatter(1:M, y);

hold on;

scatter(1:M, n, '.');

n = n * -1;

scatter(1:M, n, '.');

hold off;


figure;
scatter(1:M, z);

hold on;

scatter(1:M, n, '.');

n = n * -1;

scatter(1:M, n, '.');

hold off;

% Sorry professor, I was unable to superimpose the dashed horizontal lines,
% so I made the lines with points


x_subvectors = cell(1, 10);
for i = 1:10
    start_index = (i - 1) * 100000 + 1;
    end_index = i * 100000;
    x_subvectors{i} = x(start_index:end_index);
end

x_subvector_means = zeros(10, 1);

for j = 1:10
    
    x_subvector_means(j) = mean(x_subvectors{j});
end


y_subvectors = cell(1, 10);
for i = 1:10
    start_index = (i - 1) * 100000 + 1;
    end_index = i * 100000;
    y_subvectors{i} = y(start_index:end_index);
end

y_subvector_means = zeros(10, 1);

for j = 1:10
    
    y_subvector_means(j) = mean(y_subvectors{j});
end

z_subvectors = cell(1, 10);
for i = 1:10
    start_index = (i - 1) * 100000 + 1;
    end_index = i * 100000;
    z_subvectors{i} = z(start_index:end_index);
end

z_subvector_means = zeros(10, 1);

for j = 1:10
    
    z_subvector_means(j) = mean(z_subvectors{j});
end


%it is reasonable to say that Cauchy has a mean zero because the estimated
%means are not to far from zero and are pretty evenly distributed both
%positive and negative.






