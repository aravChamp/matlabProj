% Communications Homework 1
% Arav Sharma

clc
clear
close all

% Question 1
   
% part (a)
  
kVals = [2 4 6 8];

allConstPts = cell(size(kVals));
EbVals = zeros(length(kVals), 1);
nVals = zeros(length(kVals), 1);


for n = 1:4

    allConstPts{n} = genConstellationPts(sqrt(2^kVals(n)));
    
    disp(allConstPts{n});
    
    figure;
    
    plot(allConstPts{n}, 'o');

end

% part (b)

for i = 1:4

    M = 2^kVals(i);

    sumSqVal = sum(abs(allConstPts{i}))/M;

    EbVals(i) = sumSqVal/kVals(i);

end

% part (c)

figure;

plot(kVals, EbVals, 'o-');
xlabel('k (Number of bits per symbol)');
ylabel('E_b (Energy per bit)');
title('Energy per Bit (E_b) vs. Number of Bits per Symbol (k)');
grid on;

% part (d)

for i = 1:4

    M = 2^kVals(i);

    nVals(i) = kVals(i)/2;

end

figure;

plot(kVals, nVals, 'o-');
xlabel('k');
ylabel('n');
title('n vs. k');
grid on;


% Question 2

% part (c)

W = 1;
T = 0.25;
A = 1 / T;

% part (d)

f = 0:0.01:4;

Y = A * T * exp((-log(2) / 2) * (f / W).^2 - (1j * pi * f * T)) .* sinc(f * T);

magnitude_Y = abs(Y);

magnitude_Y_dB = 20 * log10(abs(Y));

figure;
plot(f, magnitude_Y_dB);
axis([0 4 -60 0])
xlabel('Frequency (f)');
ylabel('|Y(f)| (dB)');
title('Magnitude Spectrum of Y(f) in Decibels');
grid on;

% part (f)

t = -0.5:0.01:1;

y = A .* qfunc((2*pi*W * (t - T)) / sqrt(log(2)));

figure;
plot(t, y);
xlabel('time (t)');
ylabel('output y(t)');
title('y(t)');
grid on;







function constPts = genConstellationPts(k)
    
    constPtsQ1 = zeros((k/2)^2, 1);

    count = 1;
    
    for x = 1:k/2
        
        for y = 1:k/2
    
        constPtsQ1(count) = x + 1j*y;
    
        count = count+1;
    
        end
        
    end
    
    %M = 2^k;
    
    %A = 2 * sqrt(3 / (2 * (M - 1)));
    % This is the scaling factor I used with qammod
    % But I do not need to use it with my own constellation function

    constPtsQ1 = (constPtsQ1 - (0.5+0.5j)); %dmin = 1
    
    constPts = [constPtsQ1; -1*constPtsQ1; conj(constPtsQ1); conj(-1*constPtsQ1)];

end










