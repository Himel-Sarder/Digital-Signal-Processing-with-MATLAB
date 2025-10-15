% Parameters
n = -10:10;                 
ramp = (n >= 0).*n;   % Only positive side grows, negative side remains 0

% Plotting
stem(n, ramp, 'filled');
xlabel('n');
ylabel('Amplitude');
title('Standard Ramp Signal');
grid on;
