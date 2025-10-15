clc;
clear;
close all;

% Time domain signal
fs = 1000;              % Sampling frequency
t = 0:1/fs:1;           % Time vector (1 second)
f1 = 50;                % Frequency component 1
f2 = 150;               % Frequency component 2
x = sin(2*pi*f1*t) + sin(2*pi*f2*t);  % Composite signal

subplot(5,1,1);
plot(t, x, 'LineWidth', 1.5);
title('Time Domain Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% FFT
N = length(x);          % Number of samples

NFFT = 2^nextpow2(N);

X = fft(x, NFFT);             % Built-in FFT function

f = 0:NFFT-1;     % Frequency axis

magX = abs(X);

% Magnitude Spectrum
subplot(5,1,2);
plot(f, magX, 'r', 'LineWidth', 1.5);
title('Frequency Domain (FFT Result)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0 fs/2]);      % Show only positive frequencies
grid on;


% Low Pass
fc = 100;
order = 4;

lpass = designfilt('lowpassiir', 'FilterOrder', order, 'SampleRate', fs, 'HalfPowerFrequency', fc);

y_low = filtfilt(lpass, x);

subplot(5,1,3);
plot(t, y_low, 'r', 'LineWidth', 1.5);
title('Low pass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude');    % Show only positive frequencies
grid on;


% FFT
N = length(y_low);          % Number of samples

NFFT = 2^nextpow2(N);

X = fft(y_low, NFFT);             % Built-in FFT function

f = 0:NFFT-1;     % Frequency axis

magX = abs(X);

% Magnitude Spectrum
subplot(5,1,4);
plot(f, magX, 'r', 'LineWidth', 1.5);
title('Frequency Domain (FFT Result)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0 fs/2]);      % Show only positive frequencies
grid on;
