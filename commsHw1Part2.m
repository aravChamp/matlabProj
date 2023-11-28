clc
clear
close all


%probelm 2

%part C

W = 1;

T = 0.25;

A = 1/T;

f = sym('f');

H = exp((-log(2)/2)*(f/W)^2);

X = A*T*exp(-1j*pi*f*T)*sinc(pi*f*T);

Y = H*X;

y = matlabFunction(Y);

z = 1:1000;

for i = 1:1000
    
    z = y(i);
    
end




%part D


