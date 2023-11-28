clc
clear
close all

k = 6;

constPts = zeros((k/2)^2, 1);

count = 1;

scalFact = 1;


for x = 1:k/2
        
    for y = 1:k/2
    
    constPts(count) = x + 1j*y;
    
    count = count+1;
    
    end
        
end

constPts = constPts - (0.5 + 0.5j);

allConstPts = [constPts -1*constPts conj(constPts) conj(-1*constPts)];

allConstPtsMain = [constPts; -1*constPts; conj(constPts); conj(-1*constPts)];

figure;

plot(allConstPtsMain, 'o');