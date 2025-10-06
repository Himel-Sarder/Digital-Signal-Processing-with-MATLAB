% Parameters
n = -10:10;                 % Time vector from -10 to 10
step = (n >= 0)

% Plotting
stem(n, step, 'filled');
xlabel('n');
ylabel('Amplitude');
title('Unit Step Signal');
grid on;
