clc
clear
close all

A = magic(5)/65;
B = [normrnd(75 , 5) normrnd(75 , 5) normrnd(75 , 5) normrnd(75 , 5) normrnd(75 , 5); normrnd(75 , 5) normrnd(75 , 5) normrnd(75 , 5) normrnd(75 , 5) normrnd(75 , 5); normrnd(75 , 5) normrnd(75 , 5) normrnd(75 , 5) normrnd(75 , 5) normrnd(75 , 5); normrnd(75 , 5) normrnd(75 , 5) normrnd(75 , 5) normrnd(75 , 5) normrnd(75 , 5); normrnd(75 , 5) normrnd(75 , 5) normrnd(75 , 5) normrnd(75 , 5) normrnd(75 , 5)];
C = B*A;
D = B.*A;
F = 0.25*A.^3 + 0.25*A.^2 + 0.333A + 0.166I;
G = A.^-1;

disp(A)
disp(B)
disp(C)
disp(D)
disp(F)
disp(G)




