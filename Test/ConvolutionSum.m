clc;
close all;
clear;

% ---------------- Input Signals ----------------
x = [0, 1, 9, 1, 8];   % First signal
h = [2, 4, 6, 1];      % Second signal

% ---------------- Convolution ----------------
c = conv(x, h);         % Convolution sum
disp('Convolution Result:');
disp(c);

% ---------------- Time Vector for Plot ----------------
n = 0:length(c)-1;

% ---------------- Plot ----------------
figure;
stem(n, c, 'r', 'filled');          
xlabel('n');
ylabel('Amplitude');
title('Convolution Sum of x[n] and h[n]');
grid on;
