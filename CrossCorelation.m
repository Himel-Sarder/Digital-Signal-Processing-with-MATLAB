clc;
clear all;
close all;

%-----------------------------------------
% Step 1: Define time and frequency
%-----------------------------------------
t = 0:1:100;       % Time vector from 0 to 100
f = 0.05;          % Frequency of sine wave
x = sin(2 * pi * f * t);   % Clean sine wave

%-----------------------------------------
% Step 2: Plot clean sine wave
%-----------------------------------------
subplot(3,1,1);
plot(t, x, 'b', 'LineWidth', 2);
title('Sine Wave x(t)');
xlabel('Time');
ylabel('Amplitude');
grid on;

%-----------------------------------------
% Step 3: Add random noise
%-----------------------------------------
y = randn(1, length(t));   % Gaussian noise
z = x + y;                  % Noisy signal

subplot(3,1,2);
plot(t, z, 'r', 'LineWidth', 1.5);
title('Noisy Signal z(t) = x(t) + Noise');
xlabel('Time');
ylabel('Amplitude');
grid on;

%-----------------------------------------
% Step 4: Compute cross-correlation
%-----------------------------------------
m = xcorr(x, z);            % Cross-correlation
% m = m / max(abs(m));        % Normalize correlation

%-----------------------------------------
% Step 5: Create lag axis
%-----------------------------------------
t1 = t;
t2 = -fliplr(t1);

n1 = min(t1) + min(t2);
n2 = max(t1) + max(t2);
n = linspace(n1, n2, length(m));  % Lag vector

%-----------------------------------------
% Step 6: Plot cross-correlation
%-----------------------------------------
subplot(3,1,3);
plot(n, m, 'm', 'LineWidth', 2);
title('Cross-Correlation between x(t) and z(t)');
xlabel('Lag');
ylabel('Normalized Correlation');
grid on;

%-----------------------------------------
% Step 7: Display message
%-----------------------------------------
disp('Coss-correlation analysis completed successfully.');







%% Another way
clc;
clear;
close all;

% ------------------ Signal 1 ------------------
t = 0:0.01:1;             % Time vector
f1 = 5;                   % Frequency of x(t)
A1 = 2;                   % Amplitude of x(t)
x = A1 * sin(2 * pi * f1 * t);  % Signal x(t)

subplot(3, 1, 1)
plot(t, x, 'r', 'LineWidth', 2);
title('Signal x(t) = 2 sin(2\pi \cdot 5t)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% ------------------ Signal 2 ------------------
f2 = 25;                  % Frequency of y(t)
A2 = 3;                   % Amplitude of y(t)
y = A2 * sin(2 * pi * f2 * t);  % Signal y(t)

subplot(3, 1, 2)
plot(t, y, 'b', 'LineWidth', 2);
title('Signal y(t) = 3 sin(2\pi \cdot 25t)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% ------------------ Cross-Correlation ------------------
[R_xy, lags] = xcorr(x, y);

subplot(3, 1, 3)
stem(lags, R_xy, 'filled', 'LineWidth', 1.2);
title('Cross-Correlation R_{xy}');
xlabel('Lag');
ylabel('Correlation Value');
grid on;

