clc;
clear;
close all;

% Time index
t = -1:4;

% Signal values
x = [2, -1, 3, 4, -2, 5];

% Scaling factor
n = 3;

% Amplitude scaling
scaled_x = n * x;

% Plot original signal
subplot(2,1,1);
stem(t, x, 'filled');
xlabel('n');
ylabel('Amplitude');
title('Original Signal x[n]');

% Plot scaled signal
subplot(2,1,2);
stem(t, scaled_x, 'filled');
xlabel('n');
ylabel('Scaled Amplitude');
title('Amplitude Scaled Signal 3·x[n]');
