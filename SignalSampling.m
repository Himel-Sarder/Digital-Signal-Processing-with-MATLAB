clc;
clear all;
close all;

% Continuous-time signal
A = 1;              % Amplitude
f = 2;              % Frequency (Hz)
t = 0:0.001:1;      % Continuous time (very fine step)
x_cont = A * sin(2 * pi * f * t);   % Continuous signal

% Sampling frequency
fs = 8;             % Sampling frequency (samples per second)
Ts = 1/fs;          % Sampling period
n = 0:Ts:1;         % Discrete time points
x_samp = A * sin(2 * pi * f * n);   % Sampled signal

% Plotting
subplot(2,1,1);
plot(t, x_cont, 'b', 'LineWidth', 1.5);
title('Continuous-Time Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
stem(n, x_samp, 'r', 'filled');
hold on;
plot(t, x_cont, 'b--'); % show continuous as reference
title(['Sampled Signal (f_s = ' num2str(fs) ' Hz)']);
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

