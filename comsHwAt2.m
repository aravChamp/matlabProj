clc
clear
close all

k = 6;

M = 2^k;

maxVal = log2(k);

constPts5 = zeros(k, 1);

count = 1;

for x = 1:maxVal
    
    for y = 1:maxVal
        
    constPts5(count) = x + 1j*y;
    
    count = count+1;
        
    end
    
end




figure

plot(constPts5, 'o');
