clc;
clear all;
close all;

% --- Parameters ---
fs = 100;              % Sampling frequency
t = 0:1:100;           % Time samples
f1 = 20;               % Frequency of first signal
f2 = 40;               % Frequency of second signal

% --- Signals ---
x1 = 4 * sin(2 * pi * f1 / fs * t);    % First signal
x2 = 3 * sin(2 * pi * f2 / fs * t);    % Second signal
x_sum = x1 + x2;                       % Added signal

% --- Plot Signals ---
subplot(2,2,1);
plot(t, x1, 'b');
xlabel('Time (n)');
ylabel('Amplitude');
title('First Signal x_1[n]');
grid on;

subplot(2,2,2);
plot(t, x2, 'r');
xlabel('Time (n)');
ylabel('Amplitude');
title('Second Signal x_2[n]');
grid on;

subplot(2,2,3);
plot(t, x_sum, 'k');
xlabel('Time (n)');
ylabel('Amplitude');
title('Added Signal x[n] = x_1[n] + x_2[n]');
grid on;

% --- Manual DFT Calculation ---
N = length(x_sum);
X = zeros(1, N);

for k = 1:N
    for n = 1:N
        X(k) = X(k) + x_sum(n) * exp(-1j * 2 * pi * (k-1) * (n-1) / N);
    end
end

% --- Magnitude Spectrum ---
magX = abs(X);
freq_index = 0:(N/2)-1;
mag_half = magX(1:N/2);

% --- Plot DFT Magnitude Spectrum ---
subplot(2,2,4);
stem(freq_index, mag_half, 'filled', 'm');
xlabel('Frequency Index');
ylabel('Magnitude');
title('DFT of Added Signal (Manual Implementation)');
grid on;
