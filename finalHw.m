clc
clear
close all

% 1. Prob simulations

num_trials = 1000000;
num_even = 0; 

for i = 1:num_trials
    roll = randi(6); 
    if mod(roll, 2) == 0 
        num_even = num_even + 1; 
    end
end

prob_even = num_even / num_trials; 

num_second_die_greater_than_4 = 0; 
for i = 1:num_trials
    roll1 = randi(6); 
    if roll1 < 3 
        roll2 = randi(6); 
        if roll2 > 4 
            num_second_die_greater_than_4 = num_second_die_greater_than_4 + 1; 
        end
    end
end

prob_second_die_greater_than_4 = num_second_die_greater_than_4 / num_trials; 

num_trials = 1000000; 
num_sum_8_given_first_4_or_higher = 0; 

for i = 1:num_trials
    roll1 = randi(6); 
    if roll1 >= 4 
        roll2 = randi(6); 
        if roll1 + roll2 == 8 
            num_sum_8_given_first_4_or_higher = num_sum_8_given_first_4_or_higher + 1; 
        end
    end
end

prob_sum_8_given_first_4_or_higher = num_sum_8_given_first_4_or_higher / num_trials; 

num_trials = 1000000; 
sum_product = 0; 

for i = 1:num_trials
    roll1 = randi(6);
    roll2 = randi(6); 
    product = roll1 * roll2; 
    sum_product = sum_product + product; 
end

expected_value = sum_product / num_trials;


% 2. Poisson
 
lambda = 5;
poisson_sample = poissrnd(lambda);

if poisson_sample > 0
    binomial_sample = binornd(poisson_sample, 0.4);
else
    binomial_sample = 0;
end

lambda_prime = lambda * 0.4;
poisson_prime_sample = poissrnd(lambda_prime);

figure;
subplot(1,2,1);
histogram(binomial_sample);
title('Binomial PMF');
subplot(1,2,2);
histogram(poisson_prime_sample);
title('Poisson PMF');



% 3. m balls

N = 10000;
prob_no_replace = zeros(1, 100);
prob_replace = zeros(1, 100);

for m = 1:100
    prob_no_replace(m) = ball_prob_no_replace(m, N);
    prob_replace(m) = ball_prob_replace(m, N);
end

plot(1:100, prob_no_replace, 'b-', 1:100, prob_replace, 'r-');
legend('Without replacement', 'With replacement');
xlabel('m');
ylabel('Probability');

function p = ball_prob_replace(m, N)

count = 0;

for i = 1:N
    drawn = randi(m, 1, m);
    if all(drawn ~= 1:m)
        count = count + 1;
    end
end

p = count / N;
end

function p = ball_prob_no_replace(m, N)

count = 0;

for i = 1:N
    drawn = randperm(m);
    if all(drawn ~= 1:m)
        count = count + 1;
    end
end

p = count / N;
end


