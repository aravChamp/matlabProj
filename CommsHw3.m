clc
clear
close all

%Question 4 part e

Pe = zeros(1, 100);
step = 1 / 99;
for i = 1:100
    Pe(i) = (i - 1) * step;
end

C = (1-Pe) .* log2(1-Pe) + Pe .* log2(Pe) + 1;

figure;
plot(Pe, C);
title('Channel Capacity vs. pE');
xlabel('Pe');
ylabel('Channel Capacity (bits)');

%This does not differ with the channel capacity for the BSC

%Question 5


vars = [4 3 0.8 0.1];

%part b

lambda1 = 0.4;
lambda2 = 0.8;

[D1, R1, ~, ~] = watFill(vars, lambda1);
[D2, R2, ~, ~] = watFill(vars, lambda2);

n = linspace(0.4, 0.8, 50);

Rfind = zeros(1, length(n));
Dfind = zeros(1, length(n));

for i = 1:length(n)
    
    [Dfind(i), Rfind(i), ~, ~] = watFill(vars, n(i));
    
end

%we find lambda = 0.5633

%part c

figure;
plot(Dfind, Rfind);
title('R(D)');
xlabel('D');
ylabel('R');
hold on;
plot([D1, D2],[R1, R2], '-o')
plot(Dfind(21), Rfind(21), 'go', 'MarkerSize', 10);
hold off;

%part d

%Increasing lambda increases D while it decreases R

%part e

[~, ~, ~, Rn] = watFill(vars, 0.5633);

disp('not coded (empty):');

for i = 1:length(Rn)
    
    if Rn(i) == 0
        disp(vars(i));
    end
    
end

%part a

function [D, R, Dn, Rn] = watFill(vars, lambda)

    D = 0;
    R = 0;
    Dn = zeros(size(vars));
    Rn = zeros(size(vars));
    
    for i = 1:length(vars) 
        if vars(i) >= lambda
            Dn(i) = lambda;
        else
            Dn(i) = vars(i);
        end 
        
        Rn(i) = 0.5 * log(vars(i)/Dn(i));
        
    end
    
    D = sum(Dn);
    R = sum(Rn);
    
end


