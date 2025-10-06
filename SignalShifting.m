% Signal Shifting
% Define the original discrete signal
x = [3 5 1 4];           % Original signal values
n = -1:2;                % Time index for x[n]

% Right Shift by 2 units
x_right = x;
n_right = n + 2;

% Left Shift by 2 units
x_left = x;
n_left = n - 2;

% Plot all signals
figure;

subplot(3,1,1);
stem(n, x, 'filled');
title('Original Signal x[n]');
xlabel('n'); 
ylabel('Amplitude');

subplot(3,1,2);
stem(n_right, x_right, 'filled');
title('Right Shifted Signal x[n-2]');
xlabel('n'); 
ylabel('Amplitude');

subplot(3,1,3);
stem(n_left, x_left, 'filled');
title('Left Shifted Signal x[n+2]');
xlabel('n'); 
ylabel('Amplitude');
