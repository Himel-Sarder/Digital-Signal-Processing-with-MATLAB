clc;
close all;
clear;

Fs = 1000;        % Sampling Frequency
f = 10;           % Signal Frequency
t = 0:1/Fs:1;     % Time Vector

x = 10 * sin(2*pi*f*t);   % Signal

figure;
stem(t, x, 'r', "filled"); hold on;     % Sampled points
plot(t, x, 'g', 'LineWidth', 2);        % Continuous signal

xlabel("Time (s)");
ylabel("Amplitude");
title("Sampling a Signal");

legend("Sampled Points (stem)", "Original Continuous Signal (plot)");   % Proper legend
grid on;
