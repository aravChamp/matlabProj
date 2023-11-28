
%Fly Me To The Moon

clc
clear
close all

A = ones(100, 100);
B = zeros(100, 100);

A = ones(100, 100);
[I, J] = meshgrid(1:100, 1:100);
I = I - 50;
J = J - 50;
for i = 1:100
    for j = 1:100
        if sqrt(I(i, j)^2 + J(i, j)^2) < 20
            A(i, j) = 0;
        end
    end
end

[I, J] = meshgrid(1:100, 1:100);
index = sqrt((I - 40).^2 + (J - 40).^2) < 20;
B(index) = 1;

figure;
subplot(2, 3, 1), imshow(A), title('A');
subplot(2, 3, 2), imshow(B), title('B');
subplot(2, 3, 3), imshow(A & B), title('Intersection of A and B');
subplot(2, 3, 4), imshow(A | B), title('Union of A and B');
subplot(2, 3, 5), imshow(xor(A, B)), title('XOR of A and B');
subplot(2, 3, 6), imshow(~(A | B)), title('Complement of the Union of A and B');

%Fun with Find

clc
clear
close all


x = sin(linspace(0,5,100)) + 1;
desiredValue = 3/2;
[val, ind] = findClosest(x, desiredValue);


fprintf('The closest value to %f in sin(linspace(0,5,100)) + 1 is %f, and its index is %d.\n', desiredValue, val, ind);

function [val, ind] = findClosest(x, desiredValue)

y = x(:);

[~, ind] = min(abs(y - desiredValue));

val = y(ind);
end


%Sinc Exploration

clc
clear
close all

x = linspace(-2*pi, 2*pi, 10001);
y = normalized_sinc(x);
idx = sign_transitions(x);
r = roots(y);
xRoots = real(r);
yRoots = zeros(size(xRoots));
[pks,locs] = findpeaks(y,x);
[pks2,locs2] = findpeaks(-y,x);
minima = -pks2;



plot(x, y);
hold on;
plot(xRoots, yRoots, 'ko');
plot(locs, pks, 'r*');
plot(locs2, minima, 'r*');
hold off;


function y = normalized_sinc(x)

y = zeros(size(x));

for i = 1:length(x)
    if x(i) == 0
        y(i) = 1;
    else
        y(i) = sin(pi*x(i))/(pi*x(i));
    end
end

end

function idx = sign_transitions(x)

idx = find(diff(sign(x)) ~= 0) + 1;

end
