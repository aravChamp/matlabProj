clc
clear
close all

k = 6;

constPts = zeros(1, (k/2)^2);

count = 1;


for x = 1:k/2
        
    for y = 1:k/2
    
    constPts(:, count) = x + 1j*y;
    
    count = count+1;
    
    end
        
end

allConstPts = [constPts -1*constPts];