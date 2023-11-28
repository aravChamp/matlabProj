clc
clear
close all

A = reshape(1:100, [10, 10]);

B = magic(10);

C = diag(diag(B));

second_column = B(:,2);
B(:,2) = second_column(end:-1:1);

A = fliplr(A);

AB = A * B;
cSum = sum(AB, 2);

AB2 = A .* B;
cMean = mean(AB2, 1);

A(:,end) = [];