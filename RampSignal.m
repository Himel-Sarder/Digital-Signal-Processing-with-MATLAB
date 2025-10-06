% Parameters
n = -10:10;                 % Time vector from -10 to 10
ramp = n;        

% Plotting
stem(n, ramp, 'filled');
xlabel('n');
ylabel('Amplitude');
title('Ramp Signal');
grid on;
