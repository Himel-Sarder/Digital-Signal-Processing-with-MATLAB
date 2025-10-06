clc;
clear;
close all;

% Time index
t = -1:4;

% Signal values
x = [2, -1, 3, 4, -2, 5];

% Time reversal (folding)
t_folded = -t;

% Plot original signal
subplot(2,1,1);
stem(t, x, 'filled');
xlabel('n');
ylabel('Amplitude');
title('Original Signal x[n]');

% Plot folded signal
subplot(2,1,2);
stem(t_folded, x, 'filled');
xlabel('n');
ylabel('Amplitude');
title('Folded Signal x[-n]');
