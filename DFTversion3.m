clc;
clear;
close all;

% Time domain signal
fs = 1000;              % Sampling frequency
t = 0:1/fs:1;           % Time vector (1 second)
f1 = 50;                % Frequency component 1
f2 = 150;               % Frequency component 2
x = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t);  % Composite signal

subplot(2,1,1);
plot(t, x, 'LineWidth', 1.5);
title('Time Domain Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% FFT
N = length(x);          % Number of samples
X = fft(x);             % Built-in FFT function
f = (0:(N/2)-1)*(Fs/N);     % Frequency axis

% Magnitude Spectrum
subplot(2,1,2);
plot(f, abs(X), 'LineWidth', 1.5);
title('Frequency Domain (FFT Result)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0 fs/2]);         % Show only positive frequencies
grid on;
