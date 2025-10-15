clc;
clear;
close all;

fs = 1000;            % Sampling frequency
t = 0:1/fs:1;         % Time vector

% Composite Signal: 50 Hz + 150 Hz
x = sin(2*pi*50*t) + sin(2*pi*150*t);

%% ---------------- FFT Before Bandstop ----------------
N = length(x);
NFFT = 2^nextpow2(N);
f = (0:NFFT-1)*(fs/NFFT);
X = fft(x, NFFT);
magX = abs(X);

figure;
subplot(2,1,1);
plot(f, magX, 'b', 'LineWidth', 1.5);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('FFT Before Bandstop Filter');
xlim([0 fs/2]);
grid on;

%% ---------------- Bandstop Filter ----------------
fc1 = 45;  % Lower cut-off
fc2 = 55;  % Upper cut-off
order = 4;

bstop = designfilt('bandstopiir', ...
    'FilterOrder', order, ...
    'HalfPowerFrequency1', fc1, ...
    'HalfPowerFrequency2', fc2, ...
    'SampleRate', fs);

y_bstop = filtfilt(bstop, x);

%% ---------------- FFT After Bandstop ----------------
magY = abs(fft(y_bstop, NFFT));

subplot(2,1,2);
plot(f, magY, 'r', 'LineWidth', 1.5);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('FFT After Bandstop Filter');
xlim([0 fs/2]);
grid on;
