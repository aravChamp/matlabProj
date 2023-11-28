clc
clear
close all

A = [1 1; -1 1];

Q = gramSchmidt(A);

disp('Original set of vectors:')
disp(A)
disp('Orthonormal set of vectors:')
disp(Q)

result = isOrthonormal(Q);

if result
    disp('The set of vectors is orthonormal.')
else
    disp('The set of vectors is not orthonormal.')
end

num_vectors = 2;
vector_size = 4;

A = rand(vector_size, num_vectors + 2);

Q = gramSchmidt(A);

disp('Original set of vectors:')
disp(A)
disp('Orthonormal set of vectors:')
disp(Q)

result = isOrthonormal(Q);

if result
    disp('The set of vectors is orthonormal.')
else
    disp('The set of vectors is not orthonormal.')
end

num_vectors = 5;
vector_size = 3;

A = rand(vector_size, num_vectors + 2);

Q = gramSchmidt(A);

disp('Original set of vectors:')
disp(A)
disp('Orthonormal set of vectors:')
disp(Q)

result = isOrthonormal(Q);

if result
    disp('The set of vectors is orthonormal.')
else
    disp('The set of vectors is not orthonormal.')
end

x = linspace(0, 2, 1000);

y = sin(x);

num_gaussians = 5;
sigma = 1;
mu = linspace(0, 2, num_gaussians);
[X, M] = ndgrid(x, mu);
gaussians = (1/sqrt(2*pi*sigma^2)) * exp(-(X - M).^2 / (2*sigma^2));

figure(1)
plot(x, y, 'b-', x, gaussians, 'r-')
legend('Sinusoid', 'Gaussians')
xlabel('X')
ylabel('Y')
title('Sinusoid and Gaussians')

gaussians_ortho = gramSchmidt(gaussians);

y_est = orthoProj(y, gaussians_ortho);

figure(2)
subplot(2, 1, 1)
plot(x, y, 'b-', x, y_est, 'r-')
legend('Sinusoid', 'Estimated Sinusoid')
xlabel('X')
ylabel('Y')
title('Sinusoid and Estimated Sinusoid')

subplot(2, 1, 2)
plot(x, gaussians_ortho, 'r-')
xlabel('X')
ylabel('Y')
title('Orthonormal Basis Functions')


function Q = gramSchmidt(A)

[m, n] = size(A);

Q = zeros(m, n);

for j = 1:n
    v = A(:, j);
    
    for i = 1:j-1
        v = v - dot(v, Q(:, i)) * Q(:, i);
    end
    
    Q(:, j) = v / norm(v);
end

end

function result = isOrthonormal(A)
[m, n] = size(A);

result = 1;

for i = 1:n
    for j = i+1:n
        dot_product = dot(A(:, i), A(:, j));
        
        if abs(dot_product) > eps(1000) 
            result = 0;
            return;
        end
    end
    
    if abs(norm(A(:, i)) - 1) > eps(1000) 
        return;
    end
end
end



function proj = orthoProj(v, Q)

[m, n] = size(Q);


proj = zeros(m, 1);

for i = 1:n
    proj = proj + dot(v, Q(:, i)) * Q(:, i);
end
end
