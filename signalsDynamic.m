clc
clear
close all

%Part A

E = [3 1; 2 1];

A_0 = [-0.3 0.4; -0.4 -0.3];

eigenval1 = eig(A_0);

A = E * A_0 * inv(E);

eigenval2 = eig(A);

b = eigenval1 == eigenval2;


%Part B

s = sym('s');

F = inv(s*eye(2) - A);

f = ilaplace(F);

ht = matlabFunction(f);

%Part C

x0 = [2; 1];

xd = zeros(2, 100);

xd(:,1) = x0;

for n = 2:100
    
    xd(:,n) = ht(0.1*n) * x0;
    
end

%Part D

xde = zeros(2, 100);
xdm = zeros(2, 100);

xde(:,1) = x0;
xdm(:,1) = x0;


Ade = eye(size(A)) + 0.1 * A;
Adm = eye(size(A)) + 0.1 * A + ((0.1)^2/2) * A^2;

for n = 1:99
    
    xde(:, n+1) = Ade*xde(:, n);
    xdm(:, n+1) = Adm*xdm(:, n);
end

%part E

figure;
plot(xd(1,:), xd(2,:), 'b-');

hold on;

plot(xde(1,:), xde(2,:), 'g--');

plot(xdm(1,:), xdm(2,:), 'r--');

title('x_d[n] (blue), x_d_e[n] (green), & x_d_m[n] (red) in State Space');

hold off;


% Part F

error_xde = max(max(abs(xde-xd)));

error_xdm = max(max(abs(xdm-xd)));

%xdm error > xde error, but it is negligible

%Part G

%Based on the graph and error values, xde appears to be slightly better
%than xdm

%euler method appears to cause larger error at smaller values because the
%approimate error does not converge to zero as the time step approaches
%zero. Also, it only has first-order convergence.

