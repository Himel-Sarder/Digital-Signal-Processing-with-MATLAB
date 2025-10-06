% Parameters
n = -10:10;                 % Time vector from -10 to 10
impulse = (n == 0);         % Impulse at n = 0

% Plotting
stem(n, impulse, 'filled');
xlabel('n');
ylabel('Amplitude');
title('Unit Impulse Signal (\delta[n])');
grid on;
