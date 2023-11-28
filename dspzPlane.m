clc
clear
close all

% Question 1

num = [-2, 5, -2];
denom = [6, 13, 6, 0];

poles = roots(denom);
zeros = roots(num);

figure;
zplane(zeros, poles);
