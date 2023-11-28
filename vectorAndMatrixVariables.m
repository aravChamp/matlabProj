clc
clear
close all

aVec = [3.14 15 9 26+0.1j];

A1 = repmat(aVec, 3, 1);

A2 = [aVec; aVec; aVec];

disp(A1)
disp(A2)

bVec1 = [3.14; 15; 9; 26+0.1j];
bVec2 = transpose(aVec);

disp(bVec1)
disp(bVec2)

cVec = -5:0.1:5;
dVec = linspace(-5, 5, 100);

disp(cVec)
disp(dVec)

B = [1+2j 1e-5; exp(2*pi*j) 3+4j];

disp(B)


%C = eye(1000000, 1000000);

D = speye(1000000, 1000000);




