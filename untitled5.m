% Values of k
k_values = [2, 4, 6, 8];

% Initialize a cell array to store constellation points for each k
constellation_points = cell(length(k_values), 1);

for n = 1:4

    constellation_points{n} = genConstellationPts(kVals(n));

end

Eb_values = zeros(length(k_values), 1);

% Calculate E_b for each value of k
for i = 1:length(k_values)
    k = k_values(i);
    constellation = constellation_points{i};
    figure;
    
    plot(constellation, 'o');
    
    M = length(constellation);
    
    % Calculate the sum of squared magnitudes of constellation points
    sum_squared_magnitudes = sum(abs(constellation).^2);
    
    % Calculate E_b using the formula
    Eb = (1 / k) * (sum_squared_magnitudes / M);
    
    Eb_values(i) = Eb;
end

figure; 

plot(k_values, Eb_values, 'o-');

% Set labels and title
xlabel('k (Number of bits per symbol)');
ylabel('E_b (Energy per bit)');
title('Energy per Bit (E_b) vs. Number of Bits per Symbol (k)');
grid on;

function constPts = genConstellationPts(k)

    M = 2^k;
    
    A = sqrt(3 / (2 * (M - 1)));
    
    % Create a grid of points for both the in-phase (I) and quadrature (Q) components
    [I, Q] = meshgrid(-(sqrt(M) - 1):2:(sqrt(M) - 1), -(sqrt(M) - 1):2:(sqrt(M) - 1));
    
    % Combine I and Q components to create the constellation points
    constPts = A * (I + 1i * Q);

end

