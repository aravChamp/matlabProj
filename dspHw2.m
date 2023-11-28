clc
clear
close all

%DSP HW2

%This is the result of expanding the PSD of ARMA process:

coeffs = [-2, 5, -2]; %not square to half multiplicites

denominator = [6, 13, 6, 0];

poles = roots(denominator);
zeros = roots(coeffs);

figure;
zplane(zeros, poles);

%we need to cancel double pole at zero
% we will pad the numerator with 2 more zeros
% this is equivalent to multiplying by z^2

num = [-2, 5, -2, 0, 0];

denom = [6, 13, 0, 0, 0];

%denominator is also padded to ensure it has the same degree

zeros = roots(num);

figure;
zplane(zeros, poles);

%now to reflect points outside unit circle

reflected_poles = poles;
reflected_zeros = zeros;

for i = 1:length(poles)
    
    if abs(poles(i)) > 1
        
        reflected_poles(i) = 1/conj(poles(i));
        
    end
    
end

for i = 1:length(zeros)
    
    if abs(zeros(i)) > 1
        
        reflected_zeros(i) = 1/conj(zeros(i));
        
    end
    
end

figure;
zplane(reflected_zeros, reflected_poles);






